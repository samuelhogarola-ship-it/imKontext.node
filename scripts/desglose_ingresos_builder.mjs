import fs from "node:fs/promises";
import path from "node:path";
import { Workbook, SpreadsheetFile } from "@oai/artifact-tool";

const baseDir = "/Users/sam/Documents/imKontext";
const dataPath = path.join(baseDir, "tmp", "desglose_ingresos_data.json");
const outputDir = path.join(baseDir, "outputs", "desglose-ingresos-20260424");
const outputPath = path.join(outputDir, "desglose_ingresos_bizum_transferencias.xlsx");

const monthNames = {
  "01": "Enero",
  "02": "Febrero",
  "03": "Marzo",
  "04": "Abril",
  "05": "Mayo",
  "06": "Junio",
  "07": "Julio",
  "08": "Agosto",
  "09": "Septiembre",
  "10": "Octubre",
  "11": "Noviembre",
  "12": "Diciembre",
};

function monthLabel(monthKey) {
  const [year, month] = monthKey.split("-");
  return `${monthNames[month]} ${year}`;
}

const raw = await fs.readFile(dataPath, "utf8");
const records = JSON.parse(raw);

const workbook = Workbook.create();

const resumen = workbook.worksheets.add("Resumen");
const detalle = workbook.worksheets.add("Detalle");

const monthlyMap = new Map();
for (const record of records) {
  const entry = monthlyMap.get(record.mes) ?? {
    mes: record.mes,
    mes_label: monthLabel(record.mes),
    totalBizum: 0,
    totalTransferencia: 0,
    totalMes: 0,
    operaciones: 0,
  };
  if (record.tipo === "Bizum") entry.totalBizum += record.cantidad;
  if (record.tipo === "Transferencia") entry.totalTransferencia += record.cantidad;
  entry.totalMes += record.cantidad;
  entry.operaciones += 1;
  monthlyMap.set(record.mes, entry);
}

const monthlyRows = [...monthlyMap.values()].sort((a, b) => a.mes.localeCompare(b.mes));
const totalBizum = records.filter((r) => r.tipo === "Bizum").reduce((sum, r) => sum + r.cantidad, 0);
const totalTransferencia = records.filter((r) => r.tipo === "Transferencia").reduce((sum, r) => sum + r.cantidad, 0);
const totalGeneral = records.reduce((sum, r) => sum + r.cantidad, 0);

resumen.getRange("A1:B6").values = [
  ["Desglose de ingresos", "Bizum y transferencias"],
  ["Archivo analizado", "2026Y-04M-24D-13_00_53-Últimos movimientos.xlsx"],
  ["Operaciones encontradas", records.length],
  ["Total Bizum", totalBizum],
  ["Total transferencias", totalTransferencia],
  ["Total ingresos", totalGeneral],
];

resumen.getRange("A8:E8").values = [[
  "Mes",
  "Ingresos Bizum",
  "Ingresos transferencia",
  "Total mes",
  "Nº operaciones",
]];

if (monthlyRows.length > 0) {
  resumen.getRange(`A9:E${8 + monthlyRows.length}`).values = monthlyRows.map((row) => [
    row.mes_label,
    row.totalBizum,
    row.totalTransferencia,
    row.totalMes,
    row.operaciones,
  ]);
} else {
  resumen.getRange("A9:E9").values = [["Sin movimientos", 0, 0, 0, 0]];
}

resumen.getRange("A12:B14").values = [
  ["Notas", "En el extracto no aparecen ingresos por Bizum."],
  ["Criterio", "Solo se incluyen movimientos con importe positivo y texto Bizum o transferencia."],
  ["Persona", "Se toma del concepto más identificable disponible en movimiento u observaciones."],
];

detalle.getRange("A1:G1").values = [[
  "Mes",
  "Tipo",
  "Persona",
  "Fecha",
  "Cantidad",
  "Concepto",
  "Fila origen",
]];

if (records.length > 0) {
  detalle.getRange(`A2:G${records.length + 1}`).values = records.map((record) => [
    monthLabel(record.mes),
    record.tipo,
    record.persona,
    new Date(`${record.fecha_iso}T00:00:00`),
    record.cantidad,
    record.movimiento || record.concepto,
    record.fila_origen,
  ]);
} else {
  detalle.getRange("A2:G2").values = [["Sin movimientos", "", "", "", 0, "", ""]];
}

resumen.getRange("A1:B1").format.font = { bold: true, size: 14 };
resumen.getRange("A8:E8").format.fill = "accent1";
resumen.getRange("A8:E8").format.font = { color: "lt1", bold: true };
resumen.getRange("A8:E8").format.horizontalAlignment = "center";
resumen.getRange("A8:E8").format.wrapText = true;
resumen.getRange("B4:B6").format.numberFormat = '#,##0.00 [$EUR]';
if (monthlyRows.length > 0) {
  resumen.getRange(`B9:D${8 + monthlyRows.length}`).format.numberFormat = '#,##0.00 [$EUR]';
}
resumen.getRange("A:A").format.columnWidthPx = 180;
resumen.getRange("B:B").format.columnWidthPx = 320;
resumen.getRange("C:E").format.columnWidthPx = 130;
resumen.freezePanes.freezeRows(8);

detalle.getRange("A1:G1").format.fill = "accent1";
detalle.getRange("A1:G1").format.font = { color: "lt1", bold: true };
detalle.getRange("A1:G1").format.horizontalAlignment = "center";
detalle.getRange("A1:G1").format.wrapText = true;
detalle.getRange("A:A").format.columnWidthPx = 140;
detalle.getRange("B:B").format.columnWidthPx = 120;
detalle.getRange("C:C").format.columnWidthPx = 260;
detalle.getRange("D:D").format.columnWidthPx = 110;
detalle.getRange("E:E").format.columnWidthPx = 110;
detalle.getRange("F:F").format.columnWidthPx = 260;
detalle.getRange("G:G").format.columnWidthPx = 90;
if (records.length > 0) {
  detalle.getRange(`D2:D${records.length + 1}`).format.numberFormat = "dd/mm/yyyy";
  detalle.getRange(`E2:E${records.length + 1}`).format.numberFormat = '#,##0.00 [$EUR]';
}
detalle.freezePanes.freezeRows(1);

const resumenCheck = await workbook.inspect({
  kind: "table",
  range: "Resumen!A1:E14",
  include: "values",
  tableMaxRows: 20,
  tableMaxCols: 8,
});
console.log(resumenCheck.ndjson);

const detalleCheck = await workbook.inspect({
  kind: "table",
  range: `Detalle!A1:G${Math.max(records.length + 1, 2)}`,
  include: "values",
  tableMaxRows: 20,
  tableMaxCols: 8,
});
console.log(detalleCheck.ndjson);

await workbook.render({ sheetName: "Resumen", range: "A1:E14", scale: 1.5 });
await workbook.render({ sheetName: "Detalle", range: `A1:G${Math.max(records.length + 1, 8)}`, scale: 1.5 });

await fs.mkdir(outputDir, { recursive: true });
const exported = await SpreadsheetFile.exportXlsx(workbook);
await exported.save(outputPath);

console.log(JSON.stringify({ outputPath }));
