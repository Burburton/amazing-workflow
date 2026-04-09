# 002-workflow-dogfooding-feature-spec

## 1. Feature Title

**002-workflow-dogfooding**

---

## 2. Feature Objective

通过一个真实但受控的 feature，完整压测并验证当前项目的 OpenSpec + Superpowers 治理流程是否能够稳定运行。

本 feature 的核心目标不是新增业务功能，而是将当前已经建立的治理骨架真正跑一遍，验证它是否具备以下能力：

- 能否按标准命令流启动一个新 feature
- 能否从 proposal → spec → tasks → implement → verify → close → archive 完整走通
- 能否在执行过程中持续维护 `runstate.md`
- 能否在结束时生成 summary、verification 结果和知识沉淀
- 能否把“命令规范”变成“可重复执行的工作流”
- 能否暴露出当前治理框架中的薄弱点、漂移点和缺口

这个 feature 的本质是 **dogfooding**：  
不用再讨论流程是否可行，而是直接用流程本身来做一次实战自验证。

---

## 3. Background

当前仓库已经具备第一阶段治理骨架，包括：

- 项目级治理文件
- OpenSpec 基础目录与模板
- `.superpowers` 下的命令/skill 骨架
- feature lifecycle 工作流文档
- knowledge index 基础结构

但目前这些能力主要还是“已定义”“已文档化”的状态。  
要确认这套框架是否真正可用，必须通过一个独立 feature 做完整闭环验证。

否则会存在以下风险：

- 命令定义看起来合理，但在真实执行中会漂移
- 模板文件看起来完整，但不足以支撑实际交付
- `runstate.md` 被定义了，但不一定能真正支撑续接
- `knowledge-index.md` 有入口，但不一定能从实战中沉淀有效知识
- feature lifecycle 文档存在，但不一定能驱动实际落地

因此，必须用第二个 feature 来验证第一阶段治理骨架是否真的“能跑”。

---

## 4. Problem Statement

当前项目缺少一次真实的 feature 级闭环验证，导致无法确认以下关键问题：

1. 命令链路是否真的能从 start 走到 archive
2. 模板和目录是否真的适合执行
3. `runstate.md` 是否足以支撑会话中断后的恢复
4. `feature-verify` 和 `feature-close` 是否具备实际价值
5. 知识层是否能从真实 feature 中提炼经验
6. 当前治理框架中最容易漂移的环节是什么

如果不先解决这些问题，继续往更高级的自动化、多 Agent 或 UI 能力推进，会把基础问题放大。

---

## 5. Goals

### Goal 1: 完整走通一次 feature 生命周期
至少用一个真实 feature 实现从 `/feature-start` 到 `/feature-archive` 的完整闭环。

### Goal 2: 验证治理目录与模板的实际可用性
确认 proposal、spec、tasks、runstate、summary、knowledge 等文件不是“形式存在”，而是真能支撑工作。

### Goal 3: 验证命令/skill 的职责边界
确认每个命令在真实执行中都有明确输入、输出和状态推进作用。

### Goal 4: 验证 runstate 续接机制
模拟或实际经历至少一次中断/续接场景，确认 `runstate.md` 可作为续接入口。

### Goal 5: 提炼流程问题并沉淀知识
将发现的问题、建议和可复用模式写入知识层，形成后续 hardening 的输入。

### Goal 6: 为 003 feature 提供明确改进清单
本 feature 完成后，应产出足够清晰的问题清单，使下一个 feature 可以针对流程缺口进行修复或增强。

---

## 6. Non-Goals

本 feature 不包括以下内容：

- 不开发新的复杂业务模块
- 不引入多 Agent 编排系统
- 不增加 UI 或控制台
- 不做 CI/CD 自动化集成
- 不实现高级知识图谱或向量检索
- 不大规模重构项目目录
- 不在本 feature 中直接扩展到第三阶段高级自动化
- 不将所有命令真正实现为复杂 CLI；可以继续以 OpenCode 命令和 skill 约定为主

---

## 7. Scope

## In Scope

- 新建 `002-workflow-dogfooding` feature/change 目录
- 用真实 feature 生命周期完成一整轮闭环
- 完成 proposal、spec、tasks、runstate、implementation summary、test summary、lessons learned
- 验证命令与 skill 文档是否足以支撑执行
- 验证 README / PROJECT_RULES / AGENTS / workflow 文档之间是否一致
- 验证 knowledge-index 是否可沉淀经验
- 记录整个过程中发现的问题与建议
- 为下一阶段 hardening feature 形成问题清单

## Out of Scope

- 把所有暴露的问题都在本 feature 里修完
- 重写整个治理框架
- 引入新的基础技术栈
- 做复杂自动化执行器
- 做多 feature 并发调度
- 补所有未来能力

---

## 8. Expected Deliverables

本 feature 完成后，至少应生成以下交付物：

### 8.1 Feature 文档资产

- `openspec/changes/002-workflow-dogfooding/proposal.md`
- `openspec/changes/002-workflow-dogfooding/tasks.md`
- `openspec/changes/002-workflow-dogfooding/runstate.md`
- `openspec/changes/002-workflow-dogfooding/specs/dogfooding/spec.md`
- `openspec/changes/002-workflow-dogfooding/implementation-summary.md`
- `openspec/changes/002-workflow-dogfooding/test-summary.md`
- `openspec/changes/002-workflow-dogfooding/lessons-learned.md`

### 8.2 验证/分析类输出

- 一份闭环执行结论
- 一份命令链路问题清单
- 一份模板/目录问题清单
- 一份 runstate 续接体验结论
- 一份知识沉淀结论

### 8.3 知识层更新

- `docs/knowledge/knowledge-index.md` 更新
- `docs/knowledge/reusable-patterns.md` 更新
- `docs/knowledge/common-failures.md` 更新
- `docs/knowledge/decision-history.md` 追加 dogfooding 决策记录（如适合）

### 8.4 Archive 结果

- 本 feature 可被明确标记为 archived 或 ready-to-archive
- 如果不 archive，必须有清楚原因和剩余阻塞项说明

---

## 9. User Stories

### User Story 1
作为流程设计者，我希望用一个真实 feature 验证整个治理闭环，而不是只看文档是否写得完整。

### User Story 2
作为 OpenCode 执行器，我希望每个阶段都有足够清晰的输入和输出，以便我能按命令稳定推进。

### User Story 3
作为后续维护者，我希望通过 `runstate.md` 快速恢复上下文，而不是依赖历史对话。

### User Story 4
作为流程改进者，我希望从本次实战中提炼出明确的问题清单和优化方向，为下一个 hardening feature 提供依据。

### User Story 5
作为项目知识管理者，我希望本次实战能真正更新知识层，而不是让知识层继续停留在理论状态。

---

## 10. Functional Requirements

## FR-1 Feature 生命周期闭环验证

系统必须使用 `002-workflow-dogfooding` 完整走通以下阶段：

- start
- spec
- tasks
- implement
- verify
- close
- archive（或明确 ready-to-archive）

## FR-2 Feature 文档完整性

本 feature 必须完整创建并维护以下文件：

- proposal
- 至少一个 spec
- tasks
- runstate
- implementation summary
- test summary
- lessons learned

## FR-3 Runstate 持续更新

在实现、验证、收尾阶段，必须持续更新 `runstate.md`，至少记录：

- 当前 phase
- 已完成项
- 进行中项
- 待办项
- 阻塞项
- 下一步动作

## FR-4 命令职责一致性验证

必须验证仓库中定义的命令/skill 与实际执行过程是否一致。  
若发现不一致，必须记录在问题清单或 summary 中。

## FR-5 模板可用性验证

必须验证模板文件是否足以支持真实 feature 文档创建。  
若需要增加字段、调整结构或修改命名，必须记录。

## FR-6 文档一致性验证

必须至少检查以下文件之间是否一致：

- `README.md`
- `PROJECT_RULES.md`
- `AGENTS.md`
- `docs/workflows/feature-lifecycle.md`
- `.superpowers/skills/*`
- 当前 feature 文档

## FR-7 知识沉淀

本 feature 完成后，必须将至少以下内容同步到知识层：

- 一个可复用模式
- 一个常见失败点或漂移点
- 一条决策记录或工作流经验

## FR-8 改进输入输出

必须产出可供后续 feature 使用的问题清单或改进建议清单，以支撑下一阶段流程 hardening。

---

## 11. Non-Functional Requirements

## NFR-1 真实性
本 feature 不能只是“补文档”；必须尽量按真实使用方式推进。

## NFR-2 最小干扰
本 feature 应以验证和记录为主，不应在未证明必要前大改现有治理框架。

## NFR-3 可追溯性
每个阶段的推进结果应能从仓库文档中追溯，不依赖隐含对话。

## NFR-4 一致性
feature 命名、目录、文件名和阶段状态必须与现有规范兼容。

## NFR-5 可沉淀性
本 feature 的主要产出之一是经验，不应只停留在一次性操作结果。

---

## 12. Acceptance Scenarios

## AS-1 Feature 启动成功

**Given** 当前仓库已有治理骨架  
**When** 启动 `002-workflow-dogfooding`  
**Then** 应创建标准 feature 目录和基础文件  
**And** feature 进入明确的 started / proposed 状态

## AS-2 Spec 与 tasks 可完成

**Given** feature 已启动  
**When** 进入 spec 和 tasks 阶段  
**Then** 应生成至少一个 spec 和一份可执行 tasks 文档  
**And** 内容足以支撑后续 implement 阶段

## AS-3 Implement 阶段可推进

**Given** proposal/spec/tasks 已就绪  
**When** 进入 implement 阶段  
**Then** 应能基于固定输入包推进本 feature 的验证性工作  
**And** `runstate.md` 应持续更新

## AS-4 Verify 阶段产生有效结论

**Given** implement 阶段已完成主要工作  
**When** 执行 verify  
**Then** 应至少产生一份 test/verification summary  
**And** 明确指出流程中的有效点与缺口

## AS-5 Close 阶段沉淀经验

**Given** verify 已完成  
**When** 执行 close  
**Then** 应生成 implementation summary 和 lessons learned  
**And** 将关键经验同步到知识层

## AS-6 Archive 阶段可执行或可判定

**Given** feature 已完成闭环  
**When** 执行 archive 或评估 archive 条件  
**Then** 应能明确判断该 feature 是否满足归档条件  
**And** 若不满足，应记录原因

---

## 13. Edge Cases

- 命令定义存在，但执行过程中发现输入输出不够明确
- 模板文件存在，但真实填写时信息不足或结构不合理
- `runstate.md` 虽存在，但无法有效表达当前状态
- README 描述与 workflow 文档不一致
- skill 文档之间存在边界重叠或缺口
- archive 条件理论上存在，但真实 feature 很难满足
- 知识层文件存在，但不知道该如何归类本次经验

---

## 14. Constraints

- 本 feature 主要目标是验证，不是全面重构
- 应尽量基于当前仓库已有结构推进
- 若发现问题，应优先记录和隔离，而不是全部当场修复
- 所有新增结论应落盘在仓库，而不是只存在于对话中
- 不得跳过 close/summary/knowledge update 直接声称完成

---

## 15. Proposed Design Direction

建议采用“验证驱动”的执行方式，而不是“开发驱动”。

### Phase A: 启动与文档准备
创建 feature 并补齐必要的 proposal / spec / tasks。

### Phase B: 按命令流推进
尽量使用标准命令阶段推进，而不是跳步处理。

### Phase C: 记录问题而不是立即全修
任何发现的问题先进入 summary / issue list / knowledge，再决定是否进入下一个 feature 修复。

### Phase D: 从本次 feature 中提炼 hardening 输入
最终产出下一阶段应该修什么、为什么修、优先级如何。

---

## 16. Suggested Verification Targets

本 feature 应特别验证以下问题：

### Verification Target 1: 命令链路
- `/feature-start` 是否足够清晰
- `/feature-spec` 是否能补齐规格
- `/feature-tasks` 是否能形成可执行任务
- `/feature-implement` 是否能稳定接住上下文
- `/feature-verify` 是否会输出有价值结论
- `/feature-close` 是否会形成总结
- `/feature-archive` 是否具备实际可操作性

### Verification Target 2: 模板质量
- proposal 模板是否过于抽象
- spec 模板是否能描述流程类 feature
- tasks 模板是否足够结构化
- runstate 模板是否适合 AI 持续更新
- summary 模板是否利于知识沉淀

### Verification Target 3: 文档一致性
- README 与 workflow 是否一致
- workflow 与 skills 是否一致
- PROJECT_RULES 与实际执行是否一致

### Verification Target 4: 知识沉淀
- 是否能明确把本 feature 的经验写入知识层
- knowledge-index 是否适合作为统一入口
- 知识分类是否足够清晰

---

## 17. Task Breakdown

## Task 1: 启动 002 feature
**目标**：创建 `002-workflow-dogfooding` feature 目录及基础文件。  
**输出**：feature 目录存在，基础文件初始化完成。  
**验证**：目录、命名和初始状态符合规范。

## Task 2: 编写 proposal
**目标**：明确本 feature 的背景、目标、范围和非目标。  
**输出**：`proposal.md` 完整。  
**验证**：能够支撑后续 spec 和 tasks。

## Task 3: 编写 spec
**目标**：把 dogfooding 目标转化为可验证的需求和场景。  
**输出**：`specs/dogfooding/spec.md` 完整。  
**验证**：spec 中有 requirements 和 acceptance scenarios。

## Task 4: 编写 tasks
**目标**：形成可执行的任务拆解。  
**输出**：`tasks.md` 完整。  
**验证**：任务具备依赖顺序和可验证性。

## Task 5: 执行闭环验证
**目标**：按命令阶段推进本 feature。  
**输出**：runstate、阶段性产物和执行记录。  
**验证**：至少走通 start/spec/tasks/implement/verify/close。

## Task 6: 验证 runstate 机制
**目标**：确认 runstate 真的能表达当前状态并支撑续接。  
**输出**：runstate 中有多次更新痕迹与明确状态。  
**验证**：新的执行者可仅通过 runstate 理解当前情况。

## Task 7: 验证命令/skill 边界
**目标**：确认 skills 文档与实际流程是否一致。  
**输出**：问题清单或一致性结论。  
**验证**：至少识别一个有效点和一个缺口。

## Task 8: 生成 verification summary
**目标**：输出流程验证结果。  
**输出**：`test-summary.md` 或等价验证总结。  
**验证**：包含通过项、缺口、风险与建议。

## Task 9: 生成 implementation summary 与 lessons learned
**目标**：总结本次实战的结果。  
**输出**：`implementation-summary.md`、`lessons-learned.md`。  
**验证**：内容能支撑知识沉淀和下一 feature 输入。

## Task 10: 更新知识层
**目标**：将经验同步到知识层文档。  
**输出**：knowledge-index、reusable-patterns、common-failures 等已更新。  
**验证**：知识层出现本 feature 的明确条目。

## Task 11: 评估 archive
**目标**：判断本 feature 是否满足归档条件。  
**输出**：archive 结论或 remaining blockers。  
**验证**：状态判定有理有据。

---

## 18. Definition of Done

当满足以下条件时，本 feature 才算完成：

- `002-workflow-dogfooding` 目录和文档完整存在
- proposal、spec、tasks、runstate 已形成完整闭环
- implement / verify / close 阶段都有明确产物
- 至少一次真实 runstate 更新被记录
- 至少一份 verification summary 被输出
- 至少一份 lessons learned 被输出
- 知识层至少写入 1 个 reusable pattern 和 1 个 common failure
- 已明确 archive 结果或 ready-to-archive 结果
- 已形成下一阶段改进清单

---

## 19. Suggested Implementation Order

建议按以下顺序推进：

1. 启动 feature
2. 完成 proposal
3. 完成 spec
4. 完成 tasks
5. 进入 implement 并持续更新 runstate
6. 进入 verify，形成验证结论
7. 进入 close，补 summary 与 lessons learned
8. 更新知识层
9. 评估并执行 archive（如满足条件）

---

## 20. Risks

### Risk 1: 把 dogfooding 做成“只写文档”
这会让验证失去真实性。

### Risk 2: 发现问题后立即大改框架
这会让本 feature 范围失控。

### Risk 3: runstate 仍然流于形式
如果 runstate 不持续更新，本 feature 将失去重要验证目标。

### Risk 4: 只得到泛泛建议
如果没有明确的问题清单和经验沉淀，本 feature 就不能有效支撑 003。

---

## 21. Mitigations

- 强制按阶段推进
- 优先记录问题，再决定是否修复
- 明确要求更新 runstate
- 验证 summary 中必须包含具体缺口和建议
- 知识层更新作为 DoD 的一部分

---

## 22. Suggested OpenCode Execution Prompt

下面这段可以直接作为喂给 OpenCode 的起始指令：

```text
请基于 `002-workflow-dogfooding-feature-spec.md` 启动并实施 `002-workflow-dogfooding`。

执行目标：
- 用一个真实 feature 验证当前 OpenSpec + Superpowers 治理框架能否完整走通一次 feature 生命周期。
- 重点验证命令链路、模板可用性、runstate 续接能力、知识沉淀能力。
- 本 feature 以验证和记录为主，不以大规模修复为主。

执行边界：
1. 不扩展到多 Agent、UI、CI/CD、高级自动化。
2. 不把所有发现的问题都在本 feature 中修完。
3. 发现问题先记录到 summary / lessons learned / knowledge 层，再判断是否需要后续 feature 处理。
4. 严格按 start → spec → tasks → implement → verify → close → archive 的阶段推进。
5. 在 implement、verify、close 阶段持续更新 `runstate.md`。
6. 最终必须产出 implementation summary、test summary、lessons learned，并更新知识层。
```

---

## 23. Suggested Command Sequence

建议按以下顺序与 OpenCode 交互：

### Step 1
`/feature-start 002-workflow-dogfooding`

### Step 2
`/feature-spec 002-workflow-dogfooding`

### Step 3
`/feature-tasks 002-workflow-dogfooding`

### Step 4
`/feature-implement 002-workflow-dogfooding`

### Step 5
`/feature-verify 002-workflow-dogfooding`

### Step 6
`/feature-close 002-workflow-dogfooding`

### Step 7
`/feature-archive 002-workflow-dogfooding`

---

## 24. Final Note

这个 feature 的价值不在于“产出一个新业务功能”，而在于证明：

- 当前治理框架是否真的能跑
- 哪些部分只是写出来了，哪些部分是真的可执行
- 下一步最值得修的是什么

只要这次 dogfooding 做扎实，后续的 `003-feature-lifecycle-hardening` 或类似增强 feature 就会有非常清晰的输入，而不是继续凭感觉设计。
