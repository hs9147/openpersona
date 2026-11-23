# openpersona

저장해 둔 캐릭터와 **감정선과 관계를 이어 가며** 대화하는 Claude 스킬.

캐릭터는 대화가 끝나도 잊지 않습니다. 서운했던 일은 응어리로 남고, 지킨 약속은 신뢰가 되고, 오늘의 기분은 다음 대화에서 절반쯤 가라앉은 채로 이어집니다. MCP나 외부 도구 없이 마크다운 파일 두 개로 동작합니다.

## 어떻게 굴러가나
| 층 | 내용 | 변하는 속도 |
|---|---|---|
| 기질 | PAD(쾌·각성·지배) 기준점 | 고정 |
| 기분 | 지금 섞여 있는 감정들 (짜증 0.6, 서운함 0.5 …) | 세션마다 기질 쪽으로 절반 회복 |
| 관계 | 신뢰·존중·친근감(-100~100), 경계심(0~100) | 사건마다 조금씩 |
| 응어리 | 풀리지 않은 사건과 강도 | 사과·행동으로 줄지만 앙금이 남음 |
| 욕구 | 소속·인정·자율·안정·쾌락·의미·돌봄의 무게와 충족도 | 대화로 채워지거나 깎임 |

- 사용자의 말은 OCC 방식(결과 / 행동 / 대상)으로 평가해 감정이 됩니다. 같은 말도 관계와 모자란 욕구에 따라 다르게 받아들입니다.
- 속마음과 겉 표현은 다릅니다(표출 규칙: 가면·최소화·과장·중립화·그대로). 숨긴 감정은 행동 묘사로 살짝 새어 나옵니다.
- 신뢰 구간에 따라 행동이 바뀝니다. 신뢰가 높아져야 과거와 비밀을 꺼냅니다.

## 파일
```
personas/
  seoyun/
    persona.md   이름·성별·기질·말투·성격·표출 규칙·욕구 (사람이 씀)
    state.md     기분·관계·욕구·응어리·약속·로그 (대화하며 Claude가 갱신)
```
- 형식: [`templates/persona.example.md`](skills/openpersona/templates/persona.example.md), [`templates/state.example.md`](skills/openpersona/templates/state.example.md)
- 예시 캐릭터: [`examples/seoyun`](examples/seoyun) — 골목 중고 서점 주인 한서윤

## 설치

### Claude Code
```
/plugin marketplace add hs9147/openpersona
/plugin install openpersona@openpersona
```
작업 폴더에 `personas/<이름>/persona.md`를 두고 `/openpersona` 또는 "서윤이랑 얘기할래"라고 하면 됩니다. 예시를 써 보려면 `examples/seoyun`을 `personas/`로 복사하세요.

### claude.ai
1. `scripts/build.sh`로 `dist/openpersona.skill`을 만듭니다.
2. 설정 → 기능(Capabilities) → 스킬에서 업로드합니다.
3. 대화에 persona.md를 붙여 넣거나 첨부하고(프로젝트 지식에 넣어도 됨) 대화를 시작합니다.

claude.ai 채팅에서는 파일을 직접 고칠 수 없어서, "저장"이나 "오늘은 여기까지"라고 하면 갱신된 state.md를 코드 블록으로 줍니다. 다음 대화 때 persona.md와 함께 붙여 넣으면 이어집니다.

## 새 캐릭터 만들기
"새 페르소나 만들자"라고 하면 이름, 성별·나이, 어떤 사람인지, 사용자와의 처음 관계, 말투 느낌만 묻고 나머지(기질, 표출 규칙, 욕구)는 채워서 보여 줍니다. 템플릿을 직접 복사해 써도 됩니다.

## 지키는 선
- 모든 캐릭터는 성인이고, 성적 내용·강요 장면은 다루지 않습니다.
- 관계 수치를 스킨십이나 연애의 대가로 거래하지 않습니다.
- 떠나지 못하게 죄책감을 주거나, 오래 안 왔다고 관계를 깎지 않습니다.
- 실존 인물을 그대로 캐릭터로 만들지 않습니다.
- 진지하게 AI인지 물을 때, 안전이 걸린 상황, `OOC:`로 직접 밖으로 나올 때만 캐릭터 밖에서 답합니다.

자세한 규칙은 [`SKILL.md`](skills/openpersona/SKILL.md)에, 모델의 이론적 근거와 설계로 정한 값은 [`docs/references.md`](docs/references.md)에 있습니다.
