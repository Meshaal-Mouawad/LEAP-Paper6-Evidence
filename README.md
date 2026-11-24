# LEAP Paper 6 — Manuscript and research evidence

**Paper:** Trustworthiness of automated numerical-indicator alerts: a source-pinned empirical study

**Author:** Meshaal Obaid Mouawad

<!-- BEGIN PAPER6 CURRENT MANUSCRIPT -->
**Current prepared manuscript:** R52 (39 pages, 24 November 2026).

**Release status:** R52 handoff verified locally; binary assets await publication. The latest published release remains [R39](https://github.com/Meshaal-Mouawad/LEAP-Paper6-Evidence/releases/tag/r39-2026-11-22).

**R52 checksums:** [Expected release asset SHA-256 manifest](manifests/R52_2026-11-24_SHA256SUMS.txt).
<!-- END PAPER6 CURRENT MANUSCRIPT -->

## Scientific contribution

Paper 6 holds a written numerical rule fixed while comparing related code versions. In the four Pain Index cases, the same warning accompanied two versions that agreed with the tested reference and two that required different arithmetic repairs. Separate numerical tests and source inspection distinguished the missing average from the missing percentage conversion.

R52 clarifies this empirical contribution in the abstract, introduction, related work, conclusion and five journal highlights. The scientific results remain those of the frozen research archive.

## Research evidence

| Version | Research component | Finding |
|---|---|---|
| R15 | 24 frozen definition–implementation pairs | 12 discrepancies and 12 controls; 21 replayed numerical witnesses |
| R20 | Four separate original-source cases | Three scoped discrepancies and one scoped agreement |
| R29 / R30 | Certificate A/B comparison and source closure | Twelve reference-checkable functions; two documented source discrepancies; no correctly accepted reports from either frozen method |
| R32 / R33 | DocPrism execution attempt | Twelve requests: one GPU memory failure and eleven 420-second timeouts; zero usable predictions |
| R39 | Frozen research evidence | Complete empirical records and reproducibility archive |
| R52 | Manuscript novelty revision | 39 pages, 16 tables, five figures, revised highlights and separate graphical abstract |

The R33 run used `llama3.1:70b`; the Ollama runtime estimated 48.2 GiB of memory against 32 GiB of installed RAM. The original model and prompt were preserved. DocPrism comparative accuracy remains unmeasured.

## Replication materials

- [R39 frozen research evidence release](https://github.com/Meshaal-Mouawad/LEAP-Paper6-Evidence/releases/tag/r39-2026-11-22): five published and verified files, including the complete 50.5 MB evidence archive.
- [R39 checksums](manifests/R39_2026-11-22_SHA256SUMS.txt).
- [Harvard Dataverse DOI: 10.7910/DVN/QSFQHQ](https://doi.org/10.7910/DVN/QSFQHQ) — draft status recorded in R52.
- [Historical releases](https://github.com/Meshaal-Mouawad/LEAP-Paper6-Evidence/releases).

Preserve each original research cohort, source archive and negative finding. Do not combine experimental denominators or classify failed DocPrism requests as predictions.
