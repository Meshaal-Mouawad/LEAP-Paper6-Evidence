#!/usr/bin/env bash
# Publish the verified LEAP Paper 6 R39 archives without touching prior releases.
set -euo pipefail
repo="Meshaal-Mouawad/LEAP-Paper6-Evidence"
tag="r39-2026-11-22"
name="LEAP_Paper6_R39_Complete_Evidence_Package_2026-11-22.zip"
expected_pkg="bda3c888edc4f38d4c56c069c5457f50bad04dad3f134029d68abcf9bc42f4aa"
folder="$HOME/Documents/ChatGPT/IND LEAP Review/Paper6_R39_Manuscript_Completion_2026-11-22"
archive=""
for candidate in "$folder/$name" "$HOME/Downloads/$name"; do
  if [[ -f "$candidate" ]]; then archive="$candidate"; break; fi
done
if [[ -z "$archive" ]]; then
  echo "The complete R39 ZIP was not found in the R39 working folder or Downloads."
  echo "Place $name in Downloads and rerun this script."
  exit 1
fi
command -v gh >/dev/null || { echo "GitHub CLI (gh) not installed"; exit 1; }
gh auth status >/dev/null
actual="$(shasum -a 256 "$archive" | awk '{print $1}')"
[[ "$actual" == "$expected_pkg" ]] || { echo "R39 archive SHA-256 mismatch. Nothing was uploaded."; exit 1; }
unzip -tq "$archive" >/dev/null
temp="$(mktemp -d)"
trap 'rm -rf "$temp"' EXIT
files=(
  "LEAP_Paper6_R39_Editable_Source.zip"
  "LEAP_Paper6_R39_JSS_Manuscript.pdf"
  "LEAP_Paper6_R39_Verification_Report.md"
  "R39_Manuscript_Handoff.md"
)
expected=(
  "b88b67301e60a31510d21ee64f076217e8d1335982e593f44f641c3676fddafe"
  "442c942049f26e0cff638314530ee0c5ca35280bf77914eee05922eb34890208"
  "84f73270d81a003707a61daea05ce22bebde5dc62f228a45d108f3cf0289c750"
  "3d9f9d5409ce628617229ec947936fcd7f8dc795ba1f44d080485e97ed49dc19"
)
assets=("$archive")
for i in "${!files[@]}"; do
  file="${files[$i]}"
  unzip -p "$archive" "$file" > "$temp/$file"
  actual="$(shasum -a 256 "$temp/$file" | awk '{print $1}')"
  [[ "$actual" == "${expected[$i]}" ]] || { echo "Checksum failed for $file; nothing was uploaded."; exit 1; }
  assets+=("$temp/$file")
done
if gh release view "$tag" -R "$repo" >/dev/null 2>&1; then
  gh release upload "$tag" "${assets[@]}" -R "$repo" --clobber
else
  gh release create "$tag" "${assets[@]}" -R "$repo" --target main \
    --title "LEAP Paper 6 R39 — final source-pinned empirical study" \
    --notes "41-page JSS manuscript and verified research archives. Original R15/R20/R29/R30 findings retained. The R33 DocPrism attempt produced zero usable predictions after a documented local GPU out-of-memory error and eleven timeouts; no detector accuracy claim is made."
fi
echo
echo "Verifying GitHub's uploaded SHA-256 digests..."
remote="$(gh api "repos/$repo/releases/tags/$tag" --jq '.assets[] | [.name, .digest] | @tsv')"
printf '%s\n' "$remote"
printf '%s\n' "$remote" | grep -F "$name"$'\t'"sha256:$expected_pkg" >/dev/null
for i in "${!files[@]}"; do
  printf '%s\n' "$remote" | grep -F "${files[$i]}"$'\t'"sha256:${expected[$i]}" >/dev/null
done
echo
echo "R39 GitHub Release verified: https://github.com/$repo/releases/tag/$tag"
echo "Local archives left unchanged."
