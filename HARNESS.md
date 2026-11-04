# codex-interview-harness (v2)

A Codex harness for **interview-driven, short builds** led by a **technical partner**: understand a task from its README and data, interview a stakeholder, agree on a spec, and ship a runnable v1 within a few hours.

- **Interview-driven**: an AI interviewer reads the material first, runs the stakeholder interview area by area, and asks only what changes the build. The user relays messages and makes the calls.
- **Partner-led**: a technical partner holds the big picture, explains choices so the user can decide fast, plans batches, and directs workers — without writing production code itself.
- **Short-build specialized**: small docs, defaults instead of endless questions, the thinnest end-to-end slice first, parallel work only when the contract is fixed.
- **Generic template**: no project-specific requirements or code.

## Layout

| Path | Role |
|---|---|
| `AGENTS.md` | Rules shared by all sessions (auto-loaded by Codex) |
| `roles/interviewer.md` | Understands the material, runs the interview, writes the requirement half of the spec |
| `roles/partner.md` | Reviews the spec, sets technical direction, plans batches, splits work, merges, tests, reports |
| `roles/worker.md` | Implements an assigned part of a batch, verifies, commits |
| `roles/reviewer.md` | One-shot independent review with fresh eyes |
| `templates/` | interview / spec / decisions / tasks / batch docs (copied to `docs/` by setup) |
| `setup.sh` | Places the files in your workspace and initializes git |
| `PROMPTS.md` | Session start lines, models, deadlines (Korean) |

## Flow

1. **Understand** — the interviewer reads README and data and reports what it understood. The user sets the direction.
2. **Interview** — area by area; the user relays questions and answers; open items come back as a summary with recommendations.
3. **Design** — the partner reviews the requirements, explains the technical options, and writes the technical half, tasks, and the first batch.
4. **Build** — batch by batch; workers (one by default, more when the contract allows) build in their own scope; the partner merges and tests; a reviewer checks each batch.
5. **Finish** — the partner writes the submission doc and verifies the final state.

## Principles

- The user's attention is the scarcest resource: the user judges, relays, and approves — nothing else.
- Ask only what changes the build; apply sensible defaults and list them.
- One rule, one place; docs stay small enough to read.
- Evidence over claims; verify at logical boundaries, not after every edit.

## Usage

From your workspace root:

```
git clone https://github.com/Moon-o-verflow/codex-interview-harness.git .harness && bash .harness/setup.sh
```

Then fill the `[TBD]` deadlines in `AGENTS.md` and follow `PROMPTS.md`.

## Versions

- **v2** (current): interviewer + partner + workers + reviewer.
- **v1**: coach / prd / impl roles with per-step approvals — kept at tag `v1`.

## License

MIT
