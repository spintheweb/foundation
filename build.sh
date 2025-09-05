#!/usr/bin/env bash
set -euo pipefail

# Simple build script for LaTeX docs (Windows bash compatible)
ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DOCS_DIR="$ROOT_DIR/docs/latex"
OUT_DIR="$ROOT_DIR/build"

mkdir -p "$OUT_DIR"

cd "$DOCS_DIR"

targets=(
  atto_costitutivo.tex
  statuto.tex
  regolamento_interno.tex
  codice_etico.tex
  relazione_programmatica.tex
)

build_one() {
  local file="$1"
  echo "Building $file ..."
  latexmk -pdf -interaction=nonstopmode -outdir="$OUT_DIR" "$file"
}

# Commands: build (default) | clean | distclean
cmd="${1:-build}"

case "$cmd" in
  clean)
    for f in "${targets[@]}"; do
      if [ -f "$f" ]; then
        echo "Cleaning intermediates for $f ..."
        latexmk -c -outdir="$OUT_DIR" "$f" || true
      fi
    done
    echo "Clean completed. Intermediates removed from $OUT_DIR (PDF preservati)."
    ;;
  distclean)
    for f in "${targets[@]}"; do
      if [ -f "$f" ]; then
        echo "Dist-clean for $f (intermediates + PDF) ..."
        latexmk -C -outdir="$OUT_DIR" "$f" || true
      fi
    done
    # Remove PDFs from repo root corresponding to targets
    for f in "${targets[@]}"; do
      base="${f%.tex}"
      if [ -f "$ROOT_DIR/${base}.pdf" ]; then
        rm -f "$ROOT_DIR/${base}.pdf" || true
      fi
    done
    # Keep .gitkeep if present
    find "$OUT_DIR" -type f ! -name '.gitkeep' -delete 2>/dev/null || true
    echo "Distclean completed. $OUT_DIR emptied (salvato .gitkeep)."
    ;;
  build|*)
    # Build mandatory docs
    built=()
    for f in atto_costitutivo.tex statuto.tex; do
      build_one "$f" && built+=("$f")
    done
    # Optional docs
    for f in regolamento_interno.tex codice_etico.tex relazione_programmatica.tex; do
      if [ -f "$f" ]; then
        build_one "$f" && built+=("$f")
      fi
    done
    # Move PDFs from build/ to repo root for easy access
    for f in "${built[@]}"; do
      base="${f%.tex}"
      if [ -f "$OUT_DIR/${base}.pdf" ]; then
        mv -f "$OUT_DIR/${base}.pdf" "$ROOT_DIR/${base}.pdf"
        echo "Moved ${base}.pdf to repo root"
      fi
    done
    echo "Build completed. PDFs moved to repo root. Intermediates in $OUT_DIR"
    ;;
esac
