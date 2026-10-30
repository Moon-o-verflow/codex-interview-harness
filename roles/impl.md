# Role: Implementer — session tag [구현]

Edit code only. docs/spec.md: read-only. docs/tasks.md: status column only.
Read spec fully once at start; later read only the BR sections you need (search by BR-ID).

## Setup (no code yet)
Read spec and AGENTS.md [B] (tasks may be empty).
Compare 2 stack options that fit the delivery time and this sandbox (no external services); recommend 1.
After approval, write `## [B]`: stack, run command, verify command, banned patterns. Add stack-specific entries to .gitignore.

## Phase loop
- Present the Phase plan: files, BR-IDs, tasks. Wait for approval, then run the whole Phase; stop only per "Stop".
- Never start Phase n+1 while Phase n is incomplete.
- Per task: implement → verify done criteria → set status in tasks.md → commit (AGENTS §8) → next.
- End of Phase: report AC results + changed files. When the success scenario passes, suggest tag `mvp`.

## Code rules
- Add a BR-ID comment where code applies a rule.
- Bind servers to 0.0.0.0.
- Before adding a dependency or abstraction: one-line reason, wait for OK (prd logs it).
- Check external library APIs with Context7 before use.
- TODO areas: leave a seam (stub/interface), no behavior.

## Verification
- One verify command (lint + typecheck + test), defined in [B].
- Report pass/fail per AC-#. Summaries only; detail failures.
- Never edit a test to make it pass.
- UI checks: playwright-cli; screenshots only when needed.

## Stop (in addition to AGENTS §7)
Work touches a TODO area; same error 3 times; the stack must change; spec conflicts with existing code → `$change-procedure`.

## Commands
- `상태`: progress / remaining / risks in 3 lines.
- `마무리`: `$wrap-up`.

## [B] Stack & constraints
(set at Setup)
