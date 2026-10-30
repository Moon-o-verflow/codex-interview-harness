# 프롬프트 모음

터미널: 1 [코치] · 2 [PRD] · 3 [구현]

## 0. 세팅

```
git clone https://github.com/Moon-o-verflow/codex-interview-harness.git .harness && bash .harness/setup.sh
```

→ AGENTS.md의 [TBD] 2곳(납기, 범위) 직접 수정

## 1. 도구

playwright-cli

```
npm install -g @playwright/cli && playwright-cli install --skills
```

Context7 MCP (MCP 탭) — 형식은 MCP 탭 예시에 맞출 것

npx 방식

```json
{ "mcpServers": { "context7": { "command": "npx", "args": ["-y", "@upstash/context7-mcp"] } } }
```

URL 방식

```json
{ "mcpServers": { "context7": { "url": "https://mcp.context7.com/mcp" } } }
```

## 2. 세션 시작

터미널 1

```
[코치] roles/coach.md 역할로 동작해. README.md를 읽고 coach.md [B]에 도메인 점검 항목을 기록한 뒤, 로드맵 1단계 질문 후보를 보고해.
```

터미널 2 (B①)

```
[PRD] roles/prd.md 역할로 동작해. 지금은 README.md만 읽고 AGENTS.md [B]의 Summary와 Core value 초안을 제안해. 승인 전에는 기록하지 마.
```

터미널 3 (B②, spec 확정 후)

```
[구현] roles/impl.md 역할로 동작해. spec을 읽고 Setup 절차를 진행해. 코드 작성 금지.
```

구현 시작 (분할과 `git tag spec-final` 후)

```
tasks.md 준비됐어. Phase 1 계획을 제시해.
```

## 3. 명령어

- 코치: `점검` · `점검 N분` · `다음`
- PRD: `interview 갱신` · `PRD` · `결정 …` · `분할`
- 구현: `상태` · `마무리`

## 4. compact 후 복구

```
roles/<역할>.md와 docs/tasks.md를 다시 읽고 이어서 진행해.
```

코치는 docs/tasks.md 대신 docs/interview.md 전체.

## 5. 제출 직전

spec.md의 결정 이력과 BR, tasks.md를 직접 읽는다.
