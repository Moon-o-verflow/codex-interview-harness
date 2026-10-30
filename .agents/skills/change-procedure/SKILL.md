---
name: change-procedure
description: Use when docs/spec.md and existing code conflict, when a new 실무자 answer or resolved TODO contradicts code already built, or when an approved requirement must change. Korean trigger: 변경 절차.
---

# Change procedure

Sessions share only files; the user relays reports between sessions.

1. impl: stop. Report the conflict and affected BR-IDs.
2. prd: update spec — mark old BR 폐기 and/or add a new BR; log D-n with the reason.
3. impl: find affected files and tasks by BR-ID.
4. prd: insert change task `C#` in docs/tasks.md right before the current task.
5. impl: `git tag pre-change-D<n>`, implement, rerun the ACs linked to affected BRs.
6. impl: commit `change(D-n): summary [BR-ID]`.

Timing: success scenario or a Must breaks → now. Otherwise → record under 남은 한계; continue.

Rollback (`git reset --hard pre-change-D<n>`): never run without explicit user confirmation.
Before asking, list the commits and files that will be lost.
