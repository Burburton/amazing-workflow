# 001-governance-foundation-feature-spec

## 1. Feature Title

**001-governance-foundation**

---

## 2. Feature Objective

建立 OpenCode 可直接执行的第一阶段治理骨架，使一个全新的项目能够具备最小但完整的 **规范化 AI 开发闭环能力**。

本 feature 不追求复杂的多 Agent 自治，也不追求高级知识图谱能力。  
它的目标是先搭出一套稳定、可复用、可扩展的基础设施，让后续所有 feature 都能在统一目录、统一流程、统一归档规则下运行。

该阶段完成后，项目应具备以下基本能力：

- 可以初始化标准项目治理目录
- 可以创建标准化 feature/change 目录
- 可以自动生成基础模板文件
- 可以支撑 `/feature-start` 到 `/feature-archive` 的最小命令链路
- 可以维护 feature 的运行状态 `runstate.md`
- 可以更新项目知识索引 `knowledge-index.md`
- 可以让后续实现工作不依赖口头上下文，而依赖仓库内的规范文件

---

## 3. Background

在没有治理骨架的情况下，AI 驱动开发通常会出现以下问题：

- 需求定义分散在聊天记录中
- 不同 feature 缺少统一目录和命名规则
- 任务状态无法持续追踪
- 测试、总结、归档落点不固定
- 会话中断后，新的执行者很难接续
- 项目知识无法持续沉淀，只能依赖历史对话

虽然 OpenSpec 和 Superpowers 各自具备优势，但如果没有项目级规范层进行统一约束，它们很容易变成“工具集合”，而不是“研发系统”。

因此第一阶段必须先建设治理基础设施。

---

## 4. Problem Statement

当前缺少一套可被 OpenCode 直接执行的项目治理骨架，导致：

1. OpenSpec 与 Superpowers 无法在统一框架下稳定协作
2. feature 生命周期没有标准化落点
3. 项目知识无法结构化沉淀
4. AI 执行缺少固定输入包与规则边界
5. 后续自动化能力没有坚实基础

---

## 5. Goals

本 feature 的目标是完成以下能力建设：

### Goal 1: 建立标准目录骨架
提供与规范文档一致的核心目录结构。

### Goal 2: 建立项目级治理文件
生成 AI 可直接读取的项目规则、代理职责说明、代码库地图占位文件。

### Goal 3: 建立 OpenSpec 基础模板
提供 proposal、design、tasks、runstate、implementation-summary、test-summary、lessons-learned 模板。

### Goal 4: 建立最小命令工作流定义
定义 `/feature-start`、`/feature-spec`、`/feature-tasks`、`/feature-implement`、`/feature-verify`、`/feature-close`、`/feature-archive` 的职责和输入输出约定。

### Goal 5: 建立 runstate 机制
支持 feature 运行状态的持续更新，作为 AI 会话续接的统一入口。

### Goal 6: 建立 knowledge index 机制
支持将跨 feature 的知识沉淀到项目知识层，并维护统一索引。

---

## 6. Non-Goals

本 feature 不包括以下内容：

- 不实现复杂的多 Agent 调度系统
- 不实现自动化代码生成引擎
- 不实现完整的知识图谱或向量检索系统
- 不实现复杂 UI 或 Web 可视化控制台
- 不实现完整 CI/CD 集成
- 不要求把所有命令都做成真正可执行 CLI，可先以 OpenCode 命令规范和模板驱动方式落地
- 不处理高级权限系统或多人协作审批流

---

## 7. Scope

## In Scope

- 标准目录初始化
- 项目级治理文件初始化
- OpenSpec 模板初始化
- Superpowers 侧规则和 checklist 骨架初始化
- feature 目录模板初始化
- 命令级职责定义文档
- runstate 工作机制
- knowledge-index 工作机制
- README 中的流程入口说明
- 首个示例 feature 的可创建能力

## Out of Scope

- 自动扫描整个仓库生成完美 `CODEBASE_MAP.md`
- 自动生成高质量 feature 内容本身
- 自动理解历史项目并迁移已有文档
- 多 feature 并发状态编排
- 自动 PR 审查闭环
- 高级质量门禁自动执行器

---

## 8. Expected Deliverables

本 feature 完成后，仓库中至少应出现以下交付物：

### 8.1 核心治理文件

- `AGENTS.md`
- `PROJECT_RULES.md`
- `CODEBASE_MAP.md`
- `README.md`（补充治理流程入口）
- `openspec/project.md`
- `openspec/conventions.md`

### 8.2 模板文件

- `openspec/templates/proposal.template.md`
- `openspec/templates/design.template.md`
- `openspec/templates/tasks.template.md`
- `openspec/templates/runstate.template.md`
- `openspec/templates/implementation-summary.template.md`
- `openspec/templates/test-summary.template.md`
- `openspec/templates/lessons-learned.template.md`

### 8.3 知识层文件

- `docs/knowledge/knowledge-index.md`
- `docs/knowledge/reusable-patterns.md`
- `docs/knowledge/common-failures.md`
- `docs/knowledge/decision-history.md`

### 8.4 工作流文件

- `docs/workflows/feature-lifecycle.md`
- `docs/workflows/release-workflow.md`（可为占位版）
- `docs/workflows/incident-workflow.md`（可为占位版）

### 8.5 Superpowers 规则文件

- `.superpowers/context/execution-rules.md`
- `.superpowers/context/prompt-contract.md`
- `.superpowers/context/task-handoff.md`
- `.superpowers/checklists/implementation-checklist.md`
- `.superpowers/checklists/verification-checklist.md`
- `.superpowers/checklists/archive-checklist.md`

### 8.6 示例 feature 能力

至少证明系统可创建如下结构：

```text
openspec/changes/001-sample-feature/
├─ proposal.md
├─ tasks.md
├─ runstate.md
└─ specs/
   └─ sample/spec.md
```

---

## 9. User Stories

### User Story 1
作为项目维护者，我希望初始化一套统一治理骨架，这样后续所有 feature 都能在同一规则下推进。

### User Story 2
作为 AI 执行器，我希望每次开始工作时都有固定的规则文件和 feature 输入包，这样我不会依赖历史聊天上下文。

### User Story 3
作为后续接手者，我希望通过 `runstate.md` 快速知道某个 feature 当前状态，而不是翻遍历史记录。

### User Story 4
作为项目管理者，我希望每个 feature 完成后都能把经验同步到知识层，而不是只在单次变更目录中留下孤立文档。

### User Story 5
作为 OpenCode 命令执行框架，我希望可以按固定阶段运行 feature 生命周期，而不是每次都临时决定怎么做。

---

## 10. Functional Requirements

## FR-1 标准目录初始化

系统必须能够建立规范文档中定义的核心目录骨架，包括：

- `openspec/`
- `openspec/templates/`
- `openspec/changes/`
- `docs/architecture/`
- `docs/domain/`
- `docs/standards/`
- `docs/workflows/`
- `docs/knowledge/`
- `docs/reports/verification/`
- `docs/reports/debugging/`
- `docs/reports/reviews/`
- `.superpowers/context/`
- `.superpowers/checklists/`
- `.superpowers/templates/`

## FR-2 项目级治理文件初始化

系统必须生成项目治理所需的基础文件，并写入可编辑的初始内容，而不是空文件。

## FR-3 OpenSpec 模板初始化

系统必须提供标准模板，至少覆盖：

- proposal
- design
- tasks
- runstate
- implementation-summary
- test-summary
- lessons-learned

## FR-4 Feature 初始化机制

系统必须支持创建新的 feature 目录，并自动生成该 feature 的基础文件：

- `proposal.md`
- `tasks.md`
- `runstate.md`
- `specs/` 子目录

## FR-5 命令职责定义

系统必须提供一个清晰的命令职责映射，使 OpenCode 能理解每个命令的用途、输入、输出和阶段边界。

## FR-6 Runstate 机制

系统必须定义 `runstate.md` 的标准结构，且工作流中明确要求实现阶段持续更新该文件。

## FR-7 Knowledge Index 机制

系统必须定义 `knowledge-index.md` 的结构和更新规则，以便收尾阶段能同步经验知识。

## FR-8 README 入口说明

系统必须在 `README.md` 中提供简洁的治理工作流入口说明，使新进入者能快速理解：

- 目录是干什么的
- feature 怎么开始
- 生命周期怎么走
- 哪些文件是必须读的

---

## 11. Non-Functional Requirements

## NFR-1 一致性
所有目录与文件命名必须与规范文档保持一致，避免后续自动化识别困难。

## NFR-2 可读性
所有模板必须具备清晰标题和字段说明，不能只是空壳占位。

## NFR-3 可扩展性
第一阶段实现必须为后续加入更多命令、自动化校验和多 Agent 调度留出扩展空间。

## NFR-4 可接续性
任何一个 feature 的当前状态都必须能通过 `runstate.md` 快速恢复。

## NFR-5 最小可用
第一阶段必须优先确保“能用”，而不是追求高复杂度。

---

## 12. Acceptance Scenarios

## AS-1 初始化治理骨架

**Given** 仓库尚未具备治理目录  
**When** 执行第一阶段初始化  
**Then** 应生成标准目录骨架与治理文件  
**And** 核心模板文件应存在且可编辑  
**And** README 中应包含治理入口说明

## AS-2 创建新 feature

**Given** 治理骨架已初始化  
**When** 执行 `/feature-start` 或对应初始化逻辑  
**Then** 应生成新的 `openspec/changes/<feature>/` 目录  
**And** 自动生成 `proposal.md`、`tasks.md`、`runstate.md`、`specs/`  
**And** 文件内容应基于模板而非空白

## AS-3 AI 读取固定输入包

**Given** 存在一个已初始化的 feature  
**When** OpenCode 准备进入实现阶段  
**Then** 它应能基于固定输入包读取项目规则、feature 规格和运行状态  
**And** 不需要依赖历史会话作为唯一上下文来源

## AS-4 Runstate 支撑续接

**Given** 某 feature 已进行到中途  
**When** 新的执行者接手  
**Then** 应可以通过 `runstate.md` 明确知道当前阶段、已完成项、阻塞点和下一个动作

## AS-5 Knowledge Index 可更新

**Given** 某 feature 进入收尾阶段  
**When** 经验需要沉淀到知识层  
**Then** 应存在 `docs/knowledge/knowledge-index.md` 作为统一索引入口  
**And** 相关模式或经验可以被追加到知识层文档

---

## 13. Edge Cases

- 仓库已经存在部分目录，初始化逻辑不得粗暴覆盖已有内容
- 某些文件已存在时，应采用跳过、合并或提示更新策略，而非无条件重写
- feature 名称不规范时，应拒绝生成或自动规范化
- `runstate.md` 缺失时，后续命令应提示先恢复或重建状态
- knowledge index 为空时，收尾流程也必须能正常初始化第一条记录

---

## 14. Constraints

- 第一阶段必须尽量保持简单，不引入过多外部依赖
- 结果应优先适用于 Markdown 驱动的仓库工作流
- 命令可以先是“约定式命令”，不强制要求全部实现为完整 CLI
- 文档命名和目录结构必须稳定，以方便后续自动化工具和 AI 代理识别

---

## 15. Proposed Design Direction

建议采用“治理先行”的实现策略：

### Phase A: 目录与文件骨架
先确保项目有完整目录、模板、规则文件。

### Phase B: Feature 生命周期入口
补齐命令职责说明，让 OpenCode 可以按阶段工作。

### Phase C: 状态与知识机制
补齐 `runstate.md` 与 `knowledge-index.md` 的规则和模板。

### Phase D: 示例验证
用一个最小示例 feature 验证整套骨架可实际运作。

---

## 16. Task Breakdown

## Task 1: 初始化目录骨架
**目标**：创建规范要求的核心目录。  
**输出**：目录结构已存在。  
**验证**：目录完整，命名正确。

## Task 2: 初始化治理文件
**目标**：创建 `AGENTS.md`、`PROJECT_RULES.md`、`CODEBASE_MAP.md`、`openspec/project.md`、`openspec/conventions.md`。  
**输出**：文件存在且有基础内容。  
**验证**：内容可读，职责边界清晰。

## Task 3: 初始化模板文件
**目标**：创建所有 OpenSpec 模板。  
**输出**：模板文件完整。  
**验证**：模板具备标题和字段，而不是空白占位。

## Task 4: 初始化知识层骨架
**目标**：建立知识层文件与索引入口。  
**输出**：`knowledge-index.md` 等文件存在。  
**验证**：知识层文档可被后续 feature 追加内容。

## Task 5: 初始化 Superpowers 规则与 checklist
**目标**：建立执行规则、prompt contract、handoff 约定和 checklist。  
**输出**：`.superpowers/` 下核心文件存在。  
**验证**：执行规则和检查清单清晰。

## Task 6: 定义 feature 生命周期工作流文档
**目标**：建立 `feature-lifecycle.md`，说明从 start 到 archive 的阶段。  
**输出**：工作流文档完整。  
**验证**：阶段、输入、输出和状态流转可读。

## Task 7: 定义命令职责说明
**目标**：将 `/feature-start` 到 `/feature-archive` 的职责固定化。  
**输出**：命令职责文档或相关章节。  
**验证**：OpenCode 可基于文档理解命令边界。

## Task 8: 建立 feature 初始化能力
**目标**：支持创建一个新的示例 feature 目录并填充模板。  
**输出**：`001-sample-feature` 或类似示例 feature。  
**验证**：feature 目录结构符合规范。

## Task 9: 更新 README 入口说明
**目标**：让新使用者能快速理解怎么使用这套治理骨架。  
**输出**：README 有治理框架说明。  
**验证**：用户能从 README 直接找到流程入口。

## Task 10: 验证第一阶段最小闭环
**目标**：确认目录、模板、工作流、runstate、knowledge index 至少能跑通一次。  
**输出**：验证结论或测试摘要。  
**验证**：至少完成一次从 feature 初始化到状态记录的演示。

---

## 17. Definition of Done

当满足以下条件时，本 feature 才算完成：

- 规范要求的核心目录已存在
- 项目级治理文件已建立
- OpenSpec 模板已建立
- Superpowers 规则与 checklist 已建立
- feature 生命周期工作流文档已存在
- `/feature-start` 到 `/feature-archive` 的职责已被固定说明
- 可以创建一个示例 feature，并生成基础文件
- `runstate.md` 的结构与更新规则已明确
- `knowledge-index.md` 的结构与更新规则已明确
- README 已提供治理入口说明
- 至少完成一次最小闭环验证

---

## 18. Suggested Implementation Order

建议按以下顺序实施：

1. 目录骨架
2. 核心治理文件
3. OpenSpec 模板
4. Superpowers 规则文件
5. 工作流文档
6. 命令职责定义
7. 示例 feature 初始化
8. README 更新
9. 最小闭环验证

这样做可以先把结构稳定下来，再补充流程和验证。

---

## 19. Risks

### Risk 1: 一上来设计过重
如果第一阶段试图做太多自动化，容易把基础治理做复杂，反而难落地。

### Risk 2: 文件很多但没有真实规则
如果只是生成大量占位文件，而没有清晰职责边界，这套骨架会迅速失效。

### Risk 3: 目录和命名不稳定
如果第一阶段就频繁改目录和命名，后面自动化能力会持续返工。

### Risk 4: README 缺少入口
如果外部使用者不知道从哪里开始，这套骨架即使存在也难真正使用。

---

## 20. Mitigations

- 只做第一阶段最小可用能力
- 保持命名和目录稳定
- 每个关键文件至少写出可执行的初始规则
- 用示例 feature 验证，不靠想象判断可用性
- 在 README 中显式给出入口和最小使用路径

---

## 21. Suggested OpenCode Execution Prompt

下面这段可以直接作为你喂给 OpenCode 的起始指令：

```text
请基于 feature `001-governance-foundation` 开始实施第一阶段治理骨架。

执行要求：
1. 严格按 feature spec 中的范围推进，不要扩展到多 Agent、高级自动化、UI、CI/CD。
2. 优先完成目录骨架、治理文件、模板文件、工作流文档、Superpowers 规则文件。
3. 所有文件命名和目录结构必须与 spec 保持一致。
4. 必须创建一个最小示例 feature 来验证骨架可用。
5. 在实施过程中持续维护 runstate。
6. 完成后输出 implementation summary 和 test/verification summary。
7. 如果发现 spec 与实现不一致，先更新文档再继续。
```

---

## 22. Suggested Command Sequence

建议按以下顺序与 OpenCode 交互：

### Step 1
`/feature-start 001-governance-foundation`

### Step 2
`/feature-spec 001-governance-foundation`

用于校验当前 spec 是否足够支撑实施。

### Step 3
`/feature-tasks 001-governance-foundation`

用于把任务进一步规范化或细化。

### Step 4
`/feature-implement 001-governance-foundation`

开始搭建治理骨架。

### Step 5
`/feature-verify 001-governance-foundation`

验证目录、模板、runstate、knowledge index 和示例 feature 是否可用。

### Step 6
`/feature-close 001-governance-foundation`

补 summary 和 lessons learned。

### Step 7
`/feature-archive 001-governance-foundation`

在确认闭环完成后再归档。

---

## 23. Final Note

这个 feature 是整个项目治理体系的地基。  
它的成功标准不是“做了多少高级能力”，而是：

- 目录稳定
- 规则清楚
- 模板可用
- 流程可跑
- 状态可续
- 知识可沉淀

只要这六点立住，后面的自动化和多 Agent 能力才有真正可靠的落点。
