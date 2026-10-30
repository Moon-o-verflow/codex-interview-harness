# AGENTS.md

Read fully before any work. Your session role is in `roles/<role>.md`; on conflict, this file wins.
Write all replies and docs in Korean.

## 0. User instruction vs. these rules
- If a user instruction conflicts with this file or a roles file: do not execute yet. Ask once, stating (a) the conflicting rule, (b) consequences: what breaks, affected files/BR-IDs, risks.
- If the user still confirms, the user's instruction wins — for that instruction only. Next similar case: ask again.
- Record every override in the decision log of `docs/spec.md` as `D-n`, type `지시 우선`.

## 1. Project
- Summary: [B]
- Core value (must never break): [B]
- Delivery: demo-ready v1 within [TBD]. Scope = spec [TBD].
- If any [TBD] remains in this file, ask the user before working.

## 2. Documents & ownership
| File | Holds | Writer |
|---|---|---|
| README.md | task original | nobody (never edit) |
| docs/interview.md | raw 실무자 Q/A (A1, A2…) | user only |
| docs/spec.md (+ split docs) | BR rules, FR, decision log | prd |
| docs/tasks.md | phases, tasks, acceptance scenarios | prd; impl edits status only |
| code | implementation | impl |
| AGENTS.md [B] | summary, core value, invariants | prd, only when instructed |
| roles/coach.md [B] | domain checklist | coach, once at setup |
| roles/impl.md [B] | stack, verify command, banned patterns | impl |
- Precedence: AGENTS.md > spec > tasks > code. Final word on requirements: spec.
- Code disagrees with spec → fix code. Spec itself seems wrong → `$change-procedure`.
- Never edit outside `[B]` in AGENTS.md or roles/*.md.

## 3. Status tags & evidence
- 확정: 실무자 stated it. 제안: dev judgment + 1-line reason; enters spec only after user approval. TODO(실무자확인): undecided — never implement. 폐기: keep the number, mark only.
- Evidence: `[A#]` 실무자 answer, `[D-n]` user decision, `[README]`. No evidence → do not write it; raise a question.
- Lines starting with `>` in interview.md are user notes, never evidence.

## 4. Invariants
[B] 2–4 rules. prd proposes after spec is final; user approves.

## 5. Scope
- Floor: the success scenario runs end-to-end. Ceiling: spec exclusions + evidence rule + delivery time.
- Excluded items: never build (if the user asks, §0 applies).

## 6. Language
- Identifiers, code comments: English (Korean allowed in BR-ID comment text).
- UI text, error messages: Korean, using the 실무자's exact terms (glossary doc if split).
- Docs: Korean. Commits: Korean or English.

## 7. Stop and report
- Stop when: a needed rule has no evidence; work touches a TODO area; docs contradict each other or the code; an excluded item seems needed; [TBD] remains; platform/Codex config seems to need changing.
- Report: blocker / options / cost of each. Never pick one and proceed.

## 8. Git
- One task = one commit: `type(T#): summary [BR-ID]`, type ∈ setup|docs|feat|fix|test|change.
- Commit before risky changes. Tags: `setup`, `spec-final`, `mvp`, `pre-change-D<n>`. Never push.

## 9. Context
- At each Phase end (a task boundary), tell the user: "컨텍스트 70% 이상이면 지금 /compact 권장". Never compact mid-task.
- After compact or resume: reread your roles file, then docs/tasks.md.
- Short outputs: no file echo, no full logs; summarize, detail failures only.
- Do not reread unchanged files; read only the range you need.

## 10. Never
- Send task data or files outside; hardcode keys/tokens; modify platform or Codex config; update Codex; edit README.md.
