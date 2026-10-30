# codex-interview-harness

A Codex harness for **interview-driven, short builds**: interview a stakeholder, turn the answers into a spec, and ship a demo-ready v1 within a few hours.

- **Interview-driven**: requirements come only from a stakeholder interview (and your own logged decisions). An interview coach and a raw interview log are built in.
- **Short-build specialized**: one spec file by default, phases cut to the thinnest end-to-end slice first, and a fixed change procedure instead of re-planning.
- **Generic template**: contains no project-specific requirements or code.

## Layout

| Path | Role |
|---|---|
| `AGENTS.md` | Rules shared by all sessions (auto-loaded by Codex) |
| `roles/coach.md` | Interview coach — roadmap coverage, gap detection, next-question hints (read-only) |
| `roles/prd.md` | Spec writer — writes spec and tasks from the raw interview only |
| `roles/impl.md` | Implementer — phase-by-phase build, verification, commits |
| `.agents/skills/` | Occasional procedures: change procedure, doc split, wrap-up |
| `templates/` | Blank interview / spec / tasks docs (copied to `docs/` by setup) |
| `setup.sh` | Places the files in your workspace and initializes git |
| `PROMPTS.md` | Session start lines and command cheat sheet |

## How the sessions work

Three Codex sessions run side by side: **coach**, **prd**, **impl**.
They never talk to each other; they share files only, and you relay reports between them.

1. You interview the stakeholder and paste raw answers into `docs/interview.md`.
2. The coach tracks coverage and suggests the next question.
3. The prd session asks you about interpretations, then writes `docs/spec.md` and `docs/tasks.md`.
4. The impl session builds phase by phase against the spec.

## Principles

- Evidence only: every rule cites a stakeholder answer `[A#]` or your decision `[D-n]`. No evidence, no feature.
- Undecided items (`TODO(실무자확인)`) are never implemented.
- Rule IDs (BR-ID) trace interview → spec → code → commits.
- Docs outrank code; spec changes go through the change procedure.

## Usage

From your workspace root:

```
git clone https://github.com/Moon-o-verflow/codex-interview-harness.git .harness && bash .harness/setup.sh
```

Then fill the two `[TBD]` values in `AGENTS.md` and follow `PROMPTS.md`.

## Customize

- `[B]` sections: project-specific content filled during the session.
- `[TBD]`: delivery time and scope, set by you at the start.
- Agent-facing files are in English to save tokens; outputs and docs are in Korean (change in `AGENTS.md` §6 and the first lines).

## License

MIT
