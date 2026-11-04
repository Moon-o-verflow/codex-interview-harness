# AGENTS.md

Shared rules for every session. Your role is in `roles/<role>.md` — read it right after this file. If the two conflict, this file wins.
Reply and write all docs in Korean.

## 1. User instruction first
- If a user instruction conflicts with these rules or your role file: before acting, say once which rule it breaks and what follows (affected files, R-nn, risks).
- If the user confirms, follow it — for that instruction only. Log it in docs/decisions.md as type `지시 우선`.

## 2. Project
- Summary: [B]
- Core value (must never break): [B]
- Deadlines: [TBD]
- If any [TBD] remains, ask the user before working.

## 3. Documents & ownership
| File | Holds | Writer |
|---|---|---|
| README.md, given data | task original | nobody |
| docs/interview.md | raw DM transcript | user |
| docs/spec.md 요구 part | purpose, flows, scope, rules, assumptions, delegated items | interviewer, then partner (beyond 실무자 answers: raise as issue first) |
| docs/spec.md 기술 part | architecture, core logic, data, contracts, verification, risks | partner |
| docs/decisions.md | decision log | interviewer, partner |
| docs/tasks.md | phases, tasks, batches, status | partner |
| docs/batches/bN.md | batch plan | partner |
| code | implementation | workers, inside their assigned scope |
| shared files (dependencies, config, contract types) | | partner |
- `[B]` in this file: partner writes, after user approval.

## 4. Rules & evidence
- One line per rule: `R-nn rule sentence. (근거)` — 근거 = interview area, README, data, or D-n.
- Mark only what is not confirmed: `(가정)`, `(미확정)`, `(위임)`.
- Code that applies a rule carries an `R-nn` comment.

## 5. Who decides
- README or data has the answer → check it yourself; never ask.
- Business fact or rule → 실무자, via the user.
- Scope, priority, direction → user.
- Technical method → partner proposes.
- Low impact, or a common default exists → apply the default and list it under 가정. Do not ask.
- 실무자 says "알아서" → mark `(위임)`; bring it to the user with a recommendation.

## 6. What goes to the user
- Hard-to-reverse decisions, scope changes, business rules without evidence, disagreements between agents.
- Format: 결론 / 쟁점 (선택지 · 대가 · 추천). Short; the user decides.
- Everything else: decide, record, move on.

## 7. Verification
- Verify at the end of each logical unit, not after every edit.
- Evidence, not claims: command, exit code, test output.
- A document gets one consistency check when it is finished.

## 8. Git
- Never push. Commit message: `<task id>: summary [R-nn]`.

## 9. Context
- Compact only at a task boundary. After compact or resume: reread your role file, then docs/tasks.md.
- Short output: no file echo, no full logs; detail failures only.
- Do not reread unchanged files; read only what you need.

## 10. Never
- Send task data outside; hardcode keys; change platform or Codex settings; update Codex; edit README.md or given data.
