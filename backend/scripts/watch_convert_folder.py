from __future__ import annotations

import shutil
import subprocess
import sys
import time
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parents[1]
CONVERT_DIR = BASE_DIR / "convertir"
OUTPUT_DIR = BASE_DIR / "anadir_a_supabase"
PROCESSED_DIR = BASE_DIR / "procesados"
EPUB_TO_TXT_SCRIPT = Path(__file__).resolve().parent / "epub_to_txt.py"
TXT_TO_SEED_SCRIPT = Path(__file__).resolve().parent / "generate_seed_from_txt.py"
POLL_INTERVAL_SECONDS = 3


def main() -> None:
    ensure_directories()

    print("Escuchando nuevos EPUB en:", CONVERT_DIR)

    while True:
        try:
            process_pending_epubs()
        except KeyboardInterrupt:
            print("\nWatcher detenido por el usuario.")
            raise SystemExit(0)
        except Exception as exc:  # noqa: BLE001
            # We keep the watcher alive even if an unexpected error appears.
            print(f"Error general del watcher: {exc}", file=sys.stderr)

        time.sleep(POLL_INTERVAL_SECONDS)


def ensure_directories() -> None:
    CONVERT_DIR.mkdir(parents=True, exist_ok=True)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    PROCESSED_DIR.mkdir(parents=True, exist_ok=True)


def process_pending_epubs() -> None:
    epub_files = sorted(path for path in CONVERT_DIR.iterdir() if is_pending_epub(path))

    for epub_path in epub_files:
        process_epub(epub_path)


def is_pending_epub(path: Path) -> bool:
    return path.is_file() and path.suffix.lower() == ".epub"


def process_epub(epub_path: Path) -> None:
    base_name = epub_path.stem
    txt_output = OUTPUT_DIR / f"{base_name}.txt"
    seed_output = OUTPUT_DIR / f"{base_name}.seed.sql"
    processed_epub = build_processed_path(epub_path.name)

    print(f"EPUB detectado: {epub_path.name}")

    try:
        run_python_script(EPUB_TO_TXT_SCRIPT, epub_path, txt_output)
        print(f"TXT generado: {txt_output.name}")

        run_python_script(TXT_TO_SEED_SCRIPT, txt_output, seed_output)
        print(f"SEED generado: {seed_output.name}")

        shutil.move(str(epub_path), str(processed_epub))
        print(f"Movido a procesados: {processed_epub.name}")
    except Exception as exc:  # noqa: BLE001
        # Errors are logged and the watcher continues with future files.
        print(f"Error procesando {epub_path.name}: {exc}", file=sys.stderr)


def build_processed_path(filename: str) -> Path:
    candidate = PROCESSED_DIR / filename
    if not candidate.exists():
        return candidate

    stem = Path(filename).stem
    suffix = Path(filename).suffix
    counter = 2

    while True:
        candidate = PROCESSED_DIR / f"{stem}-{counter}{suffix}"
        if not candidate.exists():
            return candidate
        counter += 1


def run_python_script(script_path: Path, input_path: Path, output_path: Path) -> None:
    completed = subprocess.run(
        ["python3", str(script_path), str(input_path), str(output_path)],
        check=False,
        capture_output=True,
        text=True,
    )

    if completed.returncode != 0:
        stderr = completed.stderr.strip() or completed.stdout.strip() or "unknown error"
        raise RuntimeError(stderr)


if __name__ == "__main__":
    main()
