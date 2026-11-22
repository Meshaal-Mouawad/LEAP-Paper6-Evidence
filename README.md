# LEAP Paper 6 — Research evidence

**Paper:** Trustworthiness of automated numerical-indicator alerts: a source-pinned empirical study

**Author:** Meshaal Obaid Mouawad

**Latest completed manuscript:** **R39 (41 pages, 22 November 2026)**. Source and PDF were rebuilt and verified. The completed experimental results are preserved unchanged.

## Current research status

| Version | Research component | Verified finding |
|---|---|---|
| R15 | 24 frozen KPI definition–implementation pairs | 12 discrepancies, 12 controls, 21 replay-verified numerical witnesses |
| R20 | Four separate original-source cases | Three scoped discrepancies and one scoped agreement |
| R29 / R30 | Certificate A/B comparison and source closure | Twelve checkable functions, two documented discrepancies, no accepted detection by either method; no demonstrated A/B advantage |
| R32 / R33 | Original DocPrism comparison attempt | Twelve attempted requests: one GPU memory failure, eleven 420-second timeouts, **zero usable predictions** |
| R37 | JSS target and review corrections | Preserved manuscript/scientific baseline |
| R38 | Pre-result evidence review and scoring tools | Completed offline checks |
| **R39** | **Latest manuscript/evidence release** | **41-page manuscript includes actual R33 failure outcome without inventing a comparator accuracy** |

The R33 run used `llama3.1:70b`; the Ollama runtime estimated 48.2 GiB memory against 32 GiB of installed RAM. The original model and prompt were preserved. DocPrism comparative accuracy is **not estimable**. No additional experiment is required to report the bounded empirical contribution supported by R15/R20/R29/R30.

## R39 archival files

The following files belong together in the **R39 GitHub Release**, with their checksums recorded under [`manifests/R39_2026-11-22_SHA256SUMS.txt`](manifests/R39_2026-11-22_SHA256SUMS.txt):

- `LEAP_Paper6_R39_Complete_Evidence_Package_2026-11-22.zip` (complete 50.5 MB release including the final PDF, editable source, original evidence archives, runtime logs, and verification reports)
- `LEAP_Paper6_R39_Editable_Source.zip` (standalone editable article)
- `LEAP_Paper6_R39_JSS_Manuscript.pdf` (41 pages; also inside the complete ZIP)
- `LEAP_Paper6_R39_Verification_Report.md`
- `R39_Manuscript_Handoff.md`

**Upload status:** The records and SHA-256 values above are registered in this repository. The R39 binary release assets must be uploaded separately; a README update alone does not publish them.

## Preservation and verification

The R39 archive contains 17 members and passes ZIP CRC and all 16 internal SHA-256 manifest entries. Its R39 PDF contains 41 pages. A separate local LaTeX rebuild also produced 41 pages with matching extracted text; minor anti-alias/pixel differences between build environments do not affect page text.

Preserve the original R15, R20, R23, R29, R30 and R37 archives. Each has a separate provenance record. Do not merge experiment denominators, turn failed DocPrism requests into negatives, or replace the negative R29/R30 findings.

The former R37/R38 release remains in [historical releases](https://github.com/Meshaal-Mouawad/LEAP-Paper6-Evidence/releases).
