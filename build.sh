#!/usr/bin/env bash
set -euo pipefail

# Simple build script for LaTeX docs (Windows bash compatible)
ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
DOCS_DIR="$ROOT_DIR/docs/latex"
OUT_DIR="$ROOT_DIR/build"

mkdir -p "$OUT_DIR"

cd "$DOCS_DIR"

targets=(
  documentazione_istituzionale.tex
  documentazione_extra.tex
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
    built=()
    for f in "${targets[@]}"; do
      build_one "$f" && built+=("$f")
    done
      # Sposta solo i due PDF master nella root
      for f in "${built[@]}"; do
        base="${f%.tex}"
        if [ -f "$OUT_DIR/${base}.pdf" ]; then
          mv -f "$OUT_DIR/${base}.pdf" "$ROOT_DIR/${base}.pdf"
          echo "Moved ${base}.pdf to repo root"
        fi
      done
      # Rimuove eventuali altri PDF dalla root, eccetto i due master
      find "$ROOT_DIR" -maxdepth 1 -type f -name '*.pdf' ! -name 'documentazione_istituzionale.pdf' ! -name 'documentazione_extra.pdf' -exec rm -f {} +
      echo "Build completed. Solo i due PDF master sono nella root. Intermediates in $OUT_DIR"
    ;;
esac
