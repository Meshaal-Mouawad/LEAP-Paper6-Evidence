#!/usr/bin/env bash
set -euo pipefail
repo="Meshaal-Mouawad/LEAP-Paper6-Evidence"
tag="r37-r38-2026-11-21"
roots=("$HOME/Downloads" "$HOME/Documents/ChatGPT")
names=(
  "LEAP_Paper6_R37_JSS_Manuscript.pdf"
  "LEAP_Paper6_R37_Editable_Source.zip"
  "LEAP_Paper6_R37_Research_Evidence.zip"
  "LEAP_Paper6_R37_Targeted_JSS_Revision_2026-11-20.zip"
  "LEAP_Paper6_R38_PreResult_Closure_2026-11-21.zip"
)
declare -a found=()
declare -a missing=()
for name in "${names[@]}"; do
  path=""
  for root in "${roots[@]}"; do
    [[ -d "$root" ]] || continue
    path="$(find "$root" -type f -name "$name" -print -quit 2>/dev/null || true)"
    [[ -n "$path" ]] && break
  done
  if [[ -n "$path" ]]; then
    found+=("$path")
    printf 'FOUND  %s\n' "$path"
  else
    missing+=("$name")
    printf 'MISSING  %s\n' "$name"
  fi
done
if (( ${#found[@]} == 0 )); then
  echo "No archives found. Download the latest packages to ~/Downloads, then rerun."
  exit 1
fi
if ! gh release view "$tag" --repo "$repo" >/dev/null 2>&1; then
  gh release create "$tag" --repo "$repo" --target main \
    --title "Paper 6 R37 manuscript and R38 pre-result research evidence" \
    --notes "Preserved research artifacts. R33 DocPrism model execution is still awaiting actual outputs."
fi
for path in "${found[@]}"; do
  gh release upload "$tag" "$path" --repo "$repo" --clobber
done
echo
echo "LOCAL SHA-256 for uploaded files:"
shasum -a 256 "${found[@]}"
echo
echo "GitHub release assets and GitHub SHA-256 digests:"
gh api "repos/$repo/releases/tags/$tag" --jq '.assets[] | [.name, .digest, .size] | @tsv'
echo
if (( ${#missing[@]} > 0 )); then
  echo "Some files were not found locally; obtain these before considering this upload complete:"
  printf '  %s\n' "${missing[@]}"
fi
echo "Do not delete original files until uploaded digests are compared and verified."
