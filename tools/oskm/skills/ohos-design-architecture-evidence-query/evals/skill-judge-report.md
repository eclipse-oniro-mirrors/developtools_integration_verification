# Skill Evaluation Report: ohos-design-architecture-evidence-query

## Summary

- **Total Score**: 109/120 (90.8%)
- **Grade**: A
- **Pattern**: Navigation + Process
- **Knowledge Ratio**: E:A:R = 78:22:0
- **Verdict**: A production-ready skill that clearly separates runtime distribution from CLI query execution, provides strong evidence-boundary anti-patterns, and routes detailed tool knowledge through conditional references.

- **Evaluated artifact**: `packages/oskm/skills/ohos-design-architecture-evidence-query/dist/ohos-design-architecture-evidence-query-3.0.0.tar.gz`
- **Artifact SHA-256**: `b6493fad2f9abd8355e0eb97366ef906b9f60a37cb087b8de4fe57096683cc22`
- **Evaluation method**: Codex invoked the `$skill-judge` skill and followed its five-step evaluation protocol on the extracted release archive. This is a criteria-based skill evaluation, not an independent automated scorer.
- **Distribution note**: This report is added to the source evaluation set after review; the rebuilt release hash is recorded in `dist/SHA256SUMS`.
- **Package scope**: The skill package intentionally does not bundle the query engine or `knowledge.tar.gz`; it installs and describes the separately distributed runtime and CLI.

## Dimension Scores

| Dimension | Score | Max | Notes |
|-----------|-------:|-----:|-------|
| D1: Knowledge Delta | 18 | 20 | Expert content dominates: four-artifact runtime contract, fixed CLI name, explicit refresh, rollback behavior, degraded-evidence semantics, and snapshot boundaries. Minor activation content remains in command reminders. |
| D2: Mindset vs Mechanics | 14 | 15 | Strong ordered thinking: runtime readiness → database selection → evidence coverage → query entry choice. Domain-specific procedures are non-obvious and correctly sequenced. |
| D3: Anti-Pattern Quality | 14 | 15 | Seven specific prohibitions with consequences: silent download, `elf_modules=0`, confusing install targets with images, treating cfg as runtime state, guessing paths, modifying evidence, and loading maintainer docs. |
| D4: Specification Compliance | 15 | 15 | Valid frontmatter; name and directory match; description contains WHAT, WHEN, trigger keywords, capability scope, and exclusions. |
| D5: Progressive Disclosure | 13 | 15 | `SKILL.md` is 178 lines with clear routing and a `Do NOT load` rule. Deductions: `usage.md` is 635 lines and `session.md` is 352 lines, so conditional loading remains important but the reference set is heavy. |
| D6: Freedom Calibration | 13 | 15 | Good distinction between heuristics in §4.5 and hard constraints in §5. Fragile installation and evidence interpretation use precise rules; query construction allows appropriate judgment. |
| D7: Pattern Recognition | 8 | 10 | Uses a Navigation + Process hybrid: short routed entrypoint plus phased workflow. Minor deviation from a single canonical pattern because runtime installation and CLI query guidance are both substantial. |
| D-8: Practical Usability | 14 | 15 | Commands are actionable, help text is clear, exit codes are documented, examples avoid frozen database results, and failure paths route to installation or query diagnostics. |

## Critical Issues

None blocking release.

## Top 3 Improvements

1. **Split the long human-facing guide.** `references/usage.md` combines installation, download diagnostics, CLI usage, query failures, and build instructions. Splitting it into runtime installation and CLI query guides would further reduce loading cost.
2. **Compress `references/spec/session.md`.** The 352-line session specification documents tools that largely degenerate into CLI parameters. A concise CLI-equivalent table could replace most lifecycle detail.
3. **Automate `llm_judge` assertions.** `evals/evals.json` contains 8 `llm_judge` assertions that currently require manual review. An eval runner with rubric-based grading would make regression evaluation repeatable.

## Detailed Analysis

All dimensions scored at or above 80%, so no dimension requires the protocol's mandatory detailed deficiency analysis.

### Validation Evidence

- Release archive contains one package root and 43 files.
- `SKILL.md`: 178 lines.
- Frontmatter validation: `Skill is valid!`
- `evals/evals.json`: valid JSON; 8 scenarios and 29 assertions.
- `bootstrap.py --help`: successfully lists all managed commands and directs queries to `oskm-cli.pyz`.
- Source-level regression tests for the same release: 201 skill tests, 191 CLI tests, and 300 OSKM tests passed.
- No reference file is orphaned; `SKILL.md` routes reports, examples, tool index, and all 14 module specifications by task.
