# 프롬프트 모음 (v2)

## 터미널과 모델

| 터미널 | 역할 | 추론 강도 |
|---|---|---|
| 1 | 인터뷰 | medium (이해 결과 보고만 high) |
| 2 | 파트너 | high (병합·테스트 같은 운영 작업은 medium) |
| 3, 4 | 작업자 | medium (단순 반복은 low 또는 Luna) |
| 새 터미널 | 검토자 | high |

xhigh는 쓰지 않는다. 추론 강도는 `/model`에서 바꾼다.

## 데드라인 (180분 기준)

| 시점 | 끝나 있어야 할 것 |
|---|---|
| 10분 | 세팅, 이해 결과 보고 |
| 35분 | 인터뷰 종료 |
| 55분 | spec 확정, tasks와 첫 배치 문서 |
| 55~160분 | 구현 배치 |
| 170분 | 최종 통합과 검증 |
| 180분 | 제출 |

늦어지면 시간을 늘리지 말고 범위를 줄인다.

## 0. 세팅

```
git clone https://github.com/Moon-o-verflow/codex-interview-harness.git .harness && bash .harness/setup.sh
```

→ AGENTS.md의 Deadlines [TBD]를 위 표 시각으로 채운다.

## 1. 시작

터미널 1

```
[인터뷰] roles/interviewer.md 역할로 동작해. README와 데이터를 끝까지 읽고 이해 결과를 보고해. 질문은 아직 하지 마.
```

터미널 2

```
[파트너] roles/partner.md 역할로 동작해. 인터뷰가 진행되는 동안 데이터의 규모·분포·이상치와 핵심 로직 후보를 파악해 짧게 보고해. 문서는 아직 쓰지 마.
```

## 2. 인터뷰 중 (터미널 1)

- 실무자 답변은 정리하지 말고 그대로 붙여 넣는다.
- 영역이 끝나면 DM 전체를 복사해 docs/interview.md 내용을 통째로 바꾼다.
- 위임 항목은 "추천대로" 또는 직접 결정.

## 3. 설계 (터미널 2)

```
spec 검토 시작. docs/spec.md 요구 부분을 원자료와 대조해 검토하고, 실무자 질문과 쟁점을 나눠 보고해.
```

```
기술 방향을 설명하고 제안해 줘.
```

```
tasks와 첫 배치 문서를 작성해 줘.
```

## 4. 구현 (배치마다)

작업자 터미널 (병렬이면 먼저 배치 문서의 작업 폴더로 이동한 뒤 codex 실행)

```
[작업자-A] roles/worker.md 역할로 동작해. docs/batches/b1.md를 처음부터 끝까지 읽고, 문제가 없으면 A 담당 작업을 시작해.
```

배치가 끝나면 새 터미널

```
[검토] roles/reviewer.md 역할로 동작해. 배치 b1의 결과를 검토해.
```

## 5. compact · 재개 후

```
roles/<역할>.md와 docs/tasks.md를 다시 읽고 이어서 진행해.
```

## 6. 마무리 (터미널 2)

```
마무리 진행해.
```

제출 직전: docs/decisions.md와 docs/spec.md를 직접 읽는다.

## 7. 도구

playwright-cli

```
npm install -g @playwright/cli && playwright-cli install --skills
```

Context7 MCP (MCP 탭, 형식은 탭의 예시에 맞춘다)

```json
{ "mcpServers": { "context7": { "command": "npx", "args": ["-y", "@upstash/context7-mcp"] } } }
```

```json
{ "mcpServers": { "context7": { "url": "https://mcp.context7.com/mcp" } } }
```
