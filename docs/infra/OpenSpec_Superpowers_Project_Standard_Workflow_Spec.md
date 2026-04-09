# OpenSpec + Superpowers 项目标准目录与工作流规范

## 1. 文档目标

本文档定义一套全新的、可被 AI 开发系统直接执行和维护的项目规范，用于将 **OpenSpec** 与 **Superpowers** 组合成一个稳定的研发闭环。

这套规范的目标不是单纯“让 AI 写代码”，而是建立一个长期可维护的工程操作系统，使项目具备以下能力：

- 需求有明确入口，不靠口头上下文长期维持
- 设计、任务、实现、测试、验收、归档都有固定落点
- 规格与实现分层，避免文档和代码互相漂移
- 每个功能变更都可追溯、可复盘、可归档
- AI 可以在受约束的工作流中稳定执行，而不是自由发挥
- 项目知识可以不断沉淀，形成可复用的知识框架

---

## 2. 设计原则

### 2.1 单一真相源

一个信息只允许有一个主归属位置。

- 功能目标、范围、验收标准：归 OpenSpec
- 实施过程、测试结果、调试结论：归执行层文档
- 长期有效的架构知识、领域知识、规范：归项目知识层

禁止多个文件同时充当同一类信息的“真相源”。

### 2.2 规格先于实现

在功能实现前，必须先完成最小规格闭环：

- proposal
- spec
- design（如有技术复杂度）
- tasks

未进入该状态的需求，不应直接进入编码。

### 2.3 执行与归档分离

Superpowers 负责把任务做出来。  
OpenSpec 负责把变更定义清楚并归档。  
两者职责分开，避免一边执行一边随意改规格。

### 2.4 知识持续沉淀

项目不能只保留“完成结果”，还要保留：

- 为什么这么做
- 做的时候遇到了什么问题
- 哪些方案被放弃
- 哪些模式值得复用

否则项目会随着会话结束失忆。

### 2.5 AI 必须在约束中工作

AI 不应直接基于模糊需求开始大规模实现。  
所有 AI 执行都应绑定：

- 当前 feature 的 OpenSpec 文档
- 项目级规则
- 架构边界
- 当前运行状态
- 验证与归档要求

---

## 3. 工具职责边界

## 3.1 OpenSpec 的职责

OpenSpec 负责 **变更级治理**，即：

- 接收新需求
- 建立 change
- 撰写 proposal
- 维护 spec
- 在必要时维护 design
- 生成 tasks
- 在完成后执行 archive
- 形成 feature 级别的知识资产

OpenSpec 是项目变更层的真相源。

## 3.2 Superpowers 的职责

Superpowers 负责 **执行层能力**，即：

- brainstorming
- plan elaboration
- coding
- TDD / 测试补全
- debugging
- verification
- review orchestration
- 子任务并行推进

Superpowers 不是 feature 定义层，不应绕过 OpenSpec 独立定义需求边界。

## 3.3 项目规范层的职责

项目自身还需要一层独立规范，负责：

- 统一目录结构
- 统一命名规则
- 统一 feature 生命周期
- 统一文档归档方式
- 统一 AI 调用流程
- 统一知识沉淀方式

这层规范是 OpenCode 实际搭建时最关键的部分。

---

## 4. 项目目录标准

推荐采用以下目录结构：

```text
project/
├─ openspec/
│  ├─ project.md
│  ├─ conventions.md
│  ├─ changes/
│  │  ├─ 001-user-auth/
│  │  │  ├─ proposal.md
│  │  │  ├─ design.md
│  │  │  ├─ tasks.md
│  │  │  ├─ runstate.md
│  │  │  ├─ implementation-summary.md
│  │  │  ├─ test-summary.md
│  │  │  ├─ lessons-learned.md
│  │  │  └─ specs/
│  │  │     ├─ auth/spec.md
│  │  │     └─ session/spec.md
│  │  └─ archive/
│  └─ templates/
│     ├─ proposal.template.md
│     ├─ design.template.md
│     ├─ tasks.template.md
│     ├─ runstate.template.md
│     ├─ implementation-summary.template.md
│     ├─ test-summary.template.md
│     └─ lessons-learned.template.md
├─ docs/
│  ├─ architecture/
│  │  ├─ system-overview.md
│  │  ├─ module-boundaries.md
│  │  ├─ integration-map.md
│  │  └─ data-flow.md
│  ├─ domain/
│  │  ├─ glossary.md
│  │  ├─ domain-model.md
│  │  └─ business-rules.md
│  ├─ standards/
│  │  ├─ coding-standards.md
│  │  ├─ api-standards.md
│  │  ├─ testing-standards.md
│  │  ├─ logging-standards.md
│  │  └─ review-standards.md
│  ├─ workflows/
│  │  ├─ feature-lifecycle.md
│  │  ├─ release-workflow.md
│  │  └─ incident-workflow.md
│  ├─ knowledge/
│  │  ├─ knowledge-index.md
│  │  ├─ reusable-patterns.md
│  │  ├─ common-failures.md
│  │  └─ decision-history.md
│  └─ reports/
│     ├─ verification/
│     ├─ debugging/
│     └─ reviews/
├─ .superpowers/
│  ├─ context/
│  │  ├─ execution-rules.md
│  │  ├─ prompt-contract.md
│  │  └─ task-handoff.md
│  ├─ checklists/
│  │  ├─ implementation-checklist.md
│  │  ├─ verification-checklist.md
│  │  └─ archive-checklist.md
│  └─ templates/
│     ├─ execution-plan.template.md
│     ├─ debug-report.template.md
│     └─ review-summary.template.md
├─ AGENTS.md
├─ PROJECT_RULES.md
├─ CODEBASE_MAP.md
├─ README.md
└─ Makefile
```

---

## 5. 目录职责说明

## 5.1 `openspec/`

用于管理所有功能变更的规格资产，是 feature 级别的主目录。

### `project.md`
项目级目标、范围、核心目标用户、总体原则。

### `conventions.md`
OpenSpec 侧统一约定，例如：

- feature 编号规范
- 命名规范
- spec 写法
- 验收描述格式
- archive 条件

### `changes/<feature>/`
每一个功能变更的独立生命周期目录。

## 5.2 `docs/`

用于存放长期有效的项目知识，不跟随单次 feature 生命周期结束而消失。

## 5.3 `.superpowers/`

用于约束 Superpowers 的执行行为，不存放需求真相源，只存放执行规则、模板和检查清单。

## 5.4 根目录治理文件

### `AGENTS.md`
定义 AI 代理的职责边界、工作方式、禁区和协作关系。

### `PROJECT_RULES.md`
定义项目通用硬规则，例如：

- 不允许跳过 spec 直接实现
- 改动必须补测试
- 每次 feature 完成必须补 summary
- archive 前必须完成验证

### `CODEBASE_MAP.md`
快速帮助 AI 理解仓库结构，减少重复扫描项目的成本。

---

## 6. Feature 生命周期标准

一个标准 feature 必须按以下状态流转：

```text
idea
→ proposed
→ specified
→ designed
→ planned
→ implementing
→ verifying
→ completed
→ archived
```

不是所有 feature 都必须有复杂 design，但至少要经过：

```text
idea → proposed → specified → planned → implementing → verifying → archived
```

---

## 7. Feature 目录标准

以 `001-user-auth` 为例：

```text
openspec/changes/001-user-auth/
├─ proposal.md
├─ design.md
├─ tasks.md
├─ runstate.md
├─ implementation-summary.md
├─ test-summary.md
├─ lessons-learned.md
└─ specs/
   ├─ auth/spec.md
   └─ session/spec.md
```

---

## 8. 每个文件必须写什么

## 8.1 `proposal.md`

定义“为什么要做”。

建议包含：

- 背景
- 问题陈述
- 目标
- 非目标
- 影响范围
- 风险
- 成功标准

### 最关键的作用
proposal 是 feature 的业务入口，不允许直接省略。

---

## 8.2 `specs/*/spec.md`

定义“系统应该表现成什么样”。

建议结构：

- Overview
- Requirements
- Acceptance Scenarios
- Edge Cases
- Constraints
- Out of Scope

### 注意
spec 不写实现细节，spec 只描述外部行为和约束。

---

## 8.3 `design.md`

定义“准备怎么实现”。

适用于：

- 需要架构调整
- 涉及多模块改动
- 有数据结构变化
- 有性能、并发、安全风险
- 有技术选型争议

建议结构：

- Context
- Proposed Architecture
- Module Changes
- Data Flow
- API / Interface Changes
- Trade-offs
- Risks and Mitigations
- Open Questions

---

## 8.4 `tasks.md`

定义“要分几步完成”。

任务写法建议采用可验证粒度：

- Task 1: 新增 auth domain model
- Task 2: 实现 session repository
- Task 3: 增加 login API
- Task 4: 补充 integration tests
- Task 5: 更新 docs and summaries

每个 task 建议带：

- 目标
- 输入
- 输出
- 完成标准
- 依赖关系

### 关键约束
`tasks.md` 是执行任务的唯一真相源。  
Superpowers 可以展开执行计划，但不能擅自重构任务边界。

---

## 8.5 `runstate.md`

定义“现在做到哪了”。

这是 AI 连续工作的关键文件。

建议结构：

- Current Phase
- Completed Tasks
- In Progress
- Pending
- Blockers
- Important Files
- Next Action
- Last Verified At

### 作用
会话中断后，新的执行者先读 runstate，而不是先读完整历史对话。

---

## 8.6 `implementation-summary.md`

定义“实际做了什么”。

建议包含：

- 实际完成项
- 偏离设计的地方
- 新增/修改文件清单
- 尚未完成项
- 后续建议

---

## 8.7 `test-summary.md`

定义“验证结果如何”。

建议包含：

- 测试范围
- 测试类型
- 通过结果
- 未覆盖项
- 已知风险
- 回归影响

---

## 8.8 `lessons-learned.md`

定义“这次 feature 的经验教训”。

建议包含：

- 成功做法
- 失败点
- 可复用模式
- 应进入项目知识层的内容
- 对后续 feature 的建议

---

## 9. OpenSpec 与 Superpowers 的协作规则

## 9.1 总体规则

### 规则 A：OpenSpec 先行
Superpowers 不得跳过 proposal/spec/tasks 直接主导功能定义。

### 规则 B：Superpowers 只负责执行展开
Superpowers 可以：

- 拆批次
- 写执行计划
- 补实现步骤
- 补测试计划
- 做 debug 和 verification

但不能：

- 擅自改 feature 目标
- 擅自改变验收边界
- 擅自删除 spec 要求

### 规则 C：所有重要偏差必须回写
如果实现过程中发现：

- spec 不完整
- design 不成立
- 任务拆分不合理
- 出现重大技术约束

必须回写到 OpenSpec 文档，而不是只停留在会话里。

---

## 10. 标准工作流

## 10.1 阶段一：需求进入

输入可能来自：

- 用户需求
- 产品想法
- bug 修复需求
- 重构需求
- 技术债清理
- 性能优化需求

动作：

1. 创建新的 feature/change 目录
2. 编写 `proposal.md`
3. 明确目标、边界、非目标

完成标志：

- feature 有唯一编号
- proposal 已成文
- 问题陈述清晰

---

## 10.2 阶段二：规格化

动作：

1. 编写一个或多个 `spec.md`
2. 把需求转成外部行为与验收场景
3. 明确边界条件和 out-of-scope

完成标志：

- 功能预期行为可被验证
- 验收场景可读、可测

---

## 10.3 阶段三：设计

仅在有必要时执行。

动作：

1. 编写 `design.md`
2. 明确模块修改范围
3. 说明 trade-offs
4. 标出技术风险

完成标志：

- 主要设计问题已有方案
- 关键接口与数据流可理解

---

## 10.4 阶段四：任务拆解

动作：

1. 编写 `tasks.md`
2. 形成按依赖顺序排列的任务列表
3. 保证每个 task 可验证、可交接

完成标志：

- tasks 粒度合适
- 执行边界明确
- 可交给 Superpowers

---

## 10.5 阶段五：执行

此阶段以 Superpowers 为主。

执行前必须加载以下上下文：

- `PROJECT_RULES.md`
- `CODEBASE_MAP.md`
- 当前 feature 的 `proposal.md`
- 当前 feature 的所有 `spec.md`
- `design.md`（如存在）
- `tasks.md`
- `runstate.md`

执行动作：

1. 基于 tasks 展开 implementation plan
2. 按 task 顺序推进
3. 每完成一部分就更新 `runstate.md`
4. 重要实现偏差写入 summary 或 design 更新

完成标志：

- 所有 task 状态清晰
- 代码改动与 spec 对齐
- runstate 保持最新

---

## 10.6 阶段六：验证

动作：

1. 执行测试
2. 补齐缺失测试
3. 记录验证结果
4. 输出 `test-summary.md`

完成标志：

- 有清晰验证结论
- 已知缺口明确记录
- 可进入收尾

---

## 10.7 阶段七：收尾与归档

动作：

1. 完成 `implementation-summary.md`
2. 完成 `lessons-learned.md`
3. 将可复用内容同步到 `docs/knowledge/`
4. 执行 archive

完成标志：

- feature 生命周期关闭
- 核心经验被保留
- 项目知识库已更新

---

## 11. AI 执行前的标准输入包

为了让 OpenCode 稳定接管，建议把每次 feature 执行的输入固定成一个“标准输入包”。

## 11.1 必须加载的文件

- `AGENTS.md`
- `PROJECT_RULES.md`
- `CODEBASE_MAP.md`
- `openspec/project.md`
- `openspec/conventions.md`
- `openspec/changes/<feature>/proposal.md`
- `openspec/changes/<feature>/tasks.md`
- `openspec/changes/<feature>/runstate.md`
- 当前 feature 相关 `specs/**/spec.md`
- `design.md`（如存在）

## 11.2 推荐加载的文件

- `docs/architecture/system-overview.md`
- `docs/standards/testing-standards.md`
- `docs/knowledge/reusable-patterns.md`
- `docs/knowledge/common-failures.md`

---

## 12. OpenCode 中的推荐命令阶段

如果你准备通过 OpenCode 把这套规范搭起来，建议把命令层也做成固定阶段。

## 12.1 `/feature-start`
作用：

- 创建 feature 编号目录
- 复制模板
- 初始化 proposal/spec/tasks/runstate

## 12.2 `/feature-spec`
作用：

- 根据需求补全 proposal
- 生成 spec 草案
- 校验是否存在目标漂移

## 12.3 `/feature-design`
作用：

- 在需要时生成 design.md
- 输出架构影响分析
- 识别接口与数据流变更

## 12.4 `/feature-tasks`
作用：

- 生成任务列表
- 识别依赖关系
- 保证任务粒度可验证

## 12.5 `/feature-implement`
作用：

- 读取当前 feature 全量上下文
- 基于 tasks 逐步实现
- 持续更新 runstate

## 12.6 `/feature-verify`
作用：

- 生成并执行验证计划
- 输出 test-summary
- 标记缺口与风险

## 12.7 `/feature-close`
作用：

- 生成 implementation-summary
- 生成 lessons-learned
- 同步知识层
- 执行 archive 准备

## 12.8 `/feature-archive`
作用：

- 把完成的 feature 归档
- 更新 knowledge-index
- 更新 decision-history

---

## 13. 归档规则

一个 feature 满足以下条件后才允许 archive：

- proposal 完整
- spec 完整
- design（如需要）完整
- tasks 已全部关闭或标明 deferred
- runstate 已收尾
- implementation-summary 已完成
- test-summary 已完成
- lessons-learned 已完成
- 相关知识已同步到 `docs/knowledge/`

不满足以上条件的 feature，不应标记为真正完成。

---

## 14. 知识框架构建规则

项目知识层不是简单的“文档堆积区”，必须按用途分层。

## 14.1 架构知识

放入 `docs/architecture/`：

- 系统边界
- 模块职责
- 调用关系
- 数据流
- 集成方式

## 14.2 领域知识

放入 `docs/domain/`：

- 术语表
- 业务规则
- 关键实体
- 业务状态机

## 14.3 工程规范

放入 `docs/standards/`：

- 代码规范
- API 规范
- 测试规范
- 日志规范
- review 规范

## 14.4 经验知识

放入 `docs/knowledge/`：

- 可复用模式
- 常见失败案例
- 决策历史
- 经验提炼

### 关键原则
只有跨多个 feature 都有价值的内容，才进入知识层。  
单次 feature 的局部细节应留在 feature 目录。

---

## 15. 防漂移规则

## 15.1 文档与实现漂移

如果代码实现与 spec 不一致，必须二选一：

- 修改代码回到 spec
- 修改 spec 并注明原因

禁止“不一致但先不管”。

## 15.2 设计与任务漂移

如果 design 变化影响任务边界，必须同步更新 `tasks.md`。

## 15.3 会话与仓库漂移

AI 在会话中得出的重要结论，必须落盘成文档。  
不能只存在于聊天记录中。

---

## 16. 质量门禁

建议在每个阶段设置 gate。

## 16.1 Spec Gate
检查：

- 问题是否清晰
- 验收场景是否完整
- 边界是否明确
- out-of-scope 是否明确

## 16.2 Design Gate
检查：

- 风险是否识别
- 接口变化是否明确
- trade-off 是否记录
- 是否足够支撑实现

## 16.3 Implementation Gate
检查：

- 是否按 tasks 推进
- 是否更新 runstate
- 是否补测试
- 是否违反项目规则

## 16.4 Archive Gate
检查：

- summary 是否完整
- 测试结果是否记录
- lessons learned 是否沉淀
- knowledge-index 是否更新

---

## 17. 命名规范建议

## 17.1 Feature 编号

采用三位序号加语义名称：

- `001-user-auth`
- `002-session-hardening`
- `003-billing-retry`

## 17.2 Spec 目录命名

按子域命名：

- `auth/spec.md`
- `session/spec.md`
- `payments/spec.md`

## 17.3 Summary 文件命名

固定命名，不做自由发挥：

- `implementation-summary.md`
- `test-summary.md`
- `lessons-learned.md`
- `runstate.md`

这样更利于 AI 自动识别和调用。

---

## 18. 推荐模板字段

## 18.1 proposal 模板最少字段

- Title
- Background
- Problem
- Goals
- Non-Goals
- Risks
- Success Criteria

## 18.2 spec 模板最少字段

- Overview
- Requirements
- Acceptance Scenarios
- Edge Cases
- Constraints
- Out of Scope

## 18.3 tasks 模板最少字段

- Task ID
- Description
- Dependencies
- Outputs
- Verification

## 18.4 runstate 模板最少字段

- Current Phase
- Completed
- In Progress
- Pending
- Blockers
- Next Action

---

## 19. OpenCode 搭建时的实现建议

如果你要通过 OpenCode 把这套规范搭起来，建议第一阶段先做“治理骨架”，不要一上来就做很复杂的 agent 自动编排。

## 第一阶段最小可用目标

先实现：

1. 标准目录初始化
2. feature 模板自动生成
3. `/feature-start` 到 `/feature-archive` 基础命令
4. runstate 自动更新机制
5. knowledge-index 自动更新机制

这一阶段完成后，项目就已经具备“结构化 AI 开发”的基础能力。

## 第二阶段增强目标

再增强：

1. design gate / spec gate 自动检查
2. task 粒度检查
3. summary 自动补全
4. review checklist
5. archive checklist

## 第三阶段高级能力

最后再做：

1. 多 agent 并行 task 执行
2. 子任务状态追踪
3. 自动经验提炼
4. 跨 feature pattern 推荐
5. 项目知识图谱化

---

## 20. 最终推荐落地方式

最实用的落地方式不是直接追求“全自动研发”，而是先建立一个 **强治理、弱自动化** 的第一版：

- 先把目录、文档、流程、命令做规范
- 再让 OpenCode 严格围绕规范执行
- 再逐步增加自动补全、自动检查、自动归档
- 最后才做多 agent 自治

这样更稳，也更容易真正跑起来。

---

## 21. 结论

这套 OpenSpec + Superpowers 组合规范的核心不是“把两个工具拼起来”，而是建立三层分工：

- **OpenSpec 管变更定义与归档**
- **Superpowers 管执行与验证**
- **项目规范层管目录、流程、知识和治理**

只要这三层职责清楚，OpenCode 就可以把它搭成一个真正可复用的项目研发框架，而不是只靠 prompt 推动的一次性工作流。

后续真正开始搭建时，建议优先实现以下文件和命令：

### 优先文件
- `PROJECT_RULES.md`
- `AGENTS.md`
- `CODEBASE_MAP.md`
- `openspec/project.md`
- `openspec/conventions.md`
- `openspec/templates/*`

### 优先命令
- `/feature-start`
- `/feature-spec`
- `/feature-tasks`
- `/feature-implement`
- `/feature-verify`
- `/feature-close`
- `/feature-archive`

先把这些做稳，你的整套流程就可以真正进入可用状态。
