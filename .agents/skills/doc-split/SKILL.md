---
name: doc-split
description: Use once, right before finalizing docs/spec.md, to decide whether to add appendix sections or split docs. Korean trigger: 문서 분리.
---

# Doc split

| Condition | Appendix section in spec.md |
|---|---|
| ≥2 stateful objects, or ≥5 states in one | `## 부록 A. 상태 전이` — transition table, side effects |
| ≥3 roles, and what each sees/does differs | `## 부록 B. 권한` — role × action matrix |
| 실무자 uses several names for one thing, or similar names for different things | `## 부록 C. 용어` — Korean term ↔ identifier |
| ≥4 entities | `## 부록 D. 데이터 모델` — entities, relations, constraints |

- Default: add the appendix section inside spec.md. Keep these exact headings (impl searches them).
- Split into a separate file only if spec.md exceeds 300 lines. Max 2 files.
- On split: move the content, leave a one-line pointer in spec, update the 문서 지도.
- Acceptance scenarios stay in tasks.md.
- Propose first (candidate / condition met / benefit / cost); act only after approval.
