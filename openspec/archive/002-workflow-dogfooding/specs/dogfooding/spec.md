# Spec: workflow-dogfooding

## Overview

本 spec 定义 002-workflow-dogfooding 的具体需求和验收标准。核心目标是通过一个真实 feature 完整验证 OpenSpec + Superpowers 治理流程的可用性。

---

## Requirements

### Functional Requirements

#### FR-1 Feature 生命周期闭环验证

系统必须使用 `002-workflow-dogfooding` 完整走通以下阶段：

- start
- spec
- tasks
- implement
- verify
- close
- archive（或明确 ready-to-archive）

#### FR-2 Feature 文档完整性

本 feature 必须完整创建并维护以下文件：

- proposal ✓
- 至少一个 spec ✓
- tasks ✓
- runstate ✓
- implementation summary
- test summary
- lessons learned

#### FR-3 Runstate 持续更新

在实现、验证、收尾阶段，必须持续更新 `runstate.md`，至少记录：

- 当前 phase
- 已完成项
- 进行中项
- 待办项
- 阻塞项
- 下一步动作

#### FR-4 命令职责一致性验证

必须验证仓库中定义的命令/skill 与实际执行过程是否一致。若发现不一致，必须记录在问题清单或 summary 中。

#### FR-5 模板可用性验证

必须验证模板文件是否足以支持真实 feature 文档创建。若需要增加字段、调整结构或修改命名，必须记录。

#### FR-6 文档一致性验证

必须至少检查以下文件之间是否一致：

- `README.md`
- `PROJECT_RULES.md`
- `AGENTS.md`
- `docs/workflows/feature-lifecycle.md`
- `.superpowers/skills/*`
- 当前 feature 文档

#### FR-7 知识沉淀

本 feature 完成后，必须将至少以下内容同步到知识层：

- 一个可复用模式
- 一个常见失败点或漂移点
- 一条决策记录或工作流经验

#### FR-8 改进输入输出

必须产出可供后续 feature 使用的问题清单或改进建议清单，以支撑下一阶段流程 hardening。

---

### Non-Functional Requirements

#### NFR-1 真实性

本 feature 不能只是"补文档"；必须尽量按真实使用方式推进。

#### NFR-2 最小干扰

本 feature 应以验证和记录为主，不应在未证明必要前大改现有治理框架。

#### NFR-3 可追溯性

每个阶段的推进结果应能从仓库文档中追溯，不依赖隐含对话。

#### NFR-4 一致性

feature 命名、目录、文件名和阶段状态必须与现有规范兼容。

#### NFR-5 可沉淀性

本 feature 的主要产出之一是经验，不应只停留在一次性操作结果。

---

## Acceptance Scenarios

### AS-1 Feature 启动成功

**Given** 当前仓库已有治理骨架  
**When** 启动 `002-workflow-dogfooding`  
**Then** 应创建标准 feature 目录和基础文件  
**And** feature 进入明确的 started / proposed 状态

### AS-2 Spec 与 tasks 可完成

**Given** feature 已启动  
**When** 进入 spec 和 tasks 阶段  
**Then** 应生成至少一个 spec 和一份可执行 tasks 文档  
**And** 内容足以支撑后续 implement 阶段

### AS-3 Implement 阶段可推进

**Given** proposal/spec/tasks 已就绪  
**When** 进入 implement 阶段  
**Then** 应能基于固定输入包推进本 feature 的验证性工作  
**And** `runstate.md` 应持续更新

### AS-4 Verify 阶段产生有效结论

**Given** implement 阶段已完成主要工作  
**When** 执行 verify  
**Then** 应至少产生一份 test/verification summary  
**And** 明确指出流程中的有效点与缺口

### AS-5 Close 阶段沉淀经验

**Given** verify 已完成  
**When** 执行 close  
**Then** 应生成 implementation summary 和 lessons learned  
**And** 将关键经验同步到知识层

### AS-6 Archive 阜段可执行或可判定

**Given** feature 已完成闭环  
**When** 执行 archive 或评估 archive 条件  
**Then** 应能明确判断该 feature 是否满足归档条件  
**And** 若不满足，应记录原因

---

## Edge Cases

以下边界情况需要特别验证：

1. **命令定义存在，但执行过程中发现输入输出不够明确**
   - 例如：skill 工具无法调用自定义 skill
   
2. **模板文件存在，但真实填写时信息不足或结构不合理**
   - 例如：需要验证模板字段是否足够
   
3. **`runstate.md` 虽存在，但无法有效表达当前状态**
   - 例如：状态字段不足以描述实际进展
   
4. **README 描述与 workflow 文档不一致**
   - 例如：阶段名称或顺序不同
   
5. **skill 文档之间存在边界重叠或缺口**
   - 例如：两个 skill 职责不清晰
   
6. **archive 条件理论上存在，但真实 feature 很难满足**
   - 例如：条件过于严格
   
7. **知识层文件存在，但不知道该如何归类本次经验**
   - 例如：knowledge-index 结构过于简单

---

## Constraints

- 本 feature 主要目标是验证，不是全面重构
- 应尽量基于当前仓库已有结构推进
- 若发现问题，应优先记录和隔离，而不是全部当场修复
- 所有新增结论应落盘在仓库，而不是只存在于对话中
- 不得跳过 close/summary/knowledge update 直接声称完成

---

## Out of Scope

- 把所有暴露的问题都在本 feature 里修完
- 重写整个治理框架
- 引入新的基础技术栈
- 做复杂自动化执行器
- 做多 feature 并发调度
- 补所有未来能力
- 创建 docs/knowledge/reusable-patterns.md 等缺失文件（记录缺口即可）

---

## Verification Targets

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