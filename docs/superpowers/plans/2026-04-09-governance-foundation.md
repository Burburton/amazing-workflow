# Governance Foundation 精简版实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 建立 OpenSpec + Superpowers 治理骨架的第一阶段最小可用版本

**Architecture:** 采用三层分工设计（OpenSpec 管变更定义、Superpowers 管执行、项目规范层管治理），通过 AGENTS.md 作为 AI 总入口，7 个 skill 命令实现可执行的工作流

**Tech Stack:** Markdown 文档、OpenCode skill 定义、目录结构

---

## Phase A: 目录骨架创建

### Task 1: 创建核心目录结构

**Files:**
- Create: `openspec/` 目录
- Create: `openspec/templates/` 目录
- Create: `openspec/changes/` 目录
- Create: `openspec/archive/` 目录
- Create: `docs/workflows/` 目录
- Create: `docs/knowledge/` 目录
- Create: `docs/standards/` 目录
- Create: `.superpowers/context/` 目录
- Create: `.superpowers/checklists/` 目录
- Create: `.superpowers/skills/` 目录

- [ ] **Step 1: 创建所有目录**

```bash
mkdir -p openspec/templates openspec/changes openspec/archive
mkdir -p docs/workflows docs/knowledge docs/standards
mkdir -p .superpowers/context .superpowers/checklists .superpowers/skills
```

---

## Phase B: 根目录治理文件

### Task 2: 创建 AGENTS.md

**Files:**
- Create: `AGENTS.md`

- [ ] **Step 1: 创建 AGENTS.md 文件**

```markdown
# AGENTS.md - AI 项目入口

## 1. 项目概述

**项目名称**: Amazing Workflow

**项目目标**: 建立一套 OpenSpec + Superpowers 组合的项目治理框架，实现 AI 驱动的规范化研发闭环。

**核心价值**:
- 需求有明确入口，不靠口头上下文维持
- 设计、任务、实现、测试、验收、归档都有固定落点
- 规格与实现分层，避免文档和代码互相漂移
- 每个功能变更都可追溯、可复盘、可归档

**当前阶段**: 治理骨架搭建完成

---

## 2. 目录结构速查

```
amazing-workflow/
├─ AGENTS.md              # 👈 你正在读的文件（AI 入口）
├─ PROJECT_RULES.md       # 项目硬规则
├─ README.md              # 人类用户入口
│
├─ openspec/
│  ├─ project.md          # 项目级目标与范围
│  ├─ conventions.md      # OpenSpec 约定规则
│  ├─ templates/          # feature 模板目录
│  ├─ changes/            # 活跃 feature 目录
│  └─ archive/            # 已归档 feature 目录
│
├─ docs/
│  ├─ workflows/          # 工作流定义
│  ├─ knowledge/          # 知识沉淀
│  └─ standards/          # 工程规范
│
└─ .superpowers/
   ├─ context/            # 执行规则
   ├─ checklists/         # 检查清单
   └─ skills/             # skill 命令定义
```

---

## 3. Feature 生命周期

```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

| 阶段 | 命令 | 必读文件 |
|------|------|----------|
| proposed | `/feature-start` | proposal.md, runstate.md |
| specified | `/feature-spec` | specs/*/spec.md |
| planned | `/feature-tasks` | tasks.md |
| implementing | `/feature-implement` | 全部输入包 |
| verifying | `/feature-verify` | runstate.md |
| completed | `/feature-close` | implementation-summary, lessons-learned |
| archived | `/feature-archive` | 知识索引已更新 |

---

## 4. 工作规则

### 规则 1: OpenSpec 先行
**不得跳过 proposal/spec/tasks 直接编码。** 所有实现必须基于已定义的规格。

### 规则 2: 状态维护
**每个阶段必须更新 runstate.md。** 这是 AI 会话续接的关键文件。

### 规则 3: 知识沉淀
**feature 完成后同步到 knowledge-index.md。** 确保项目知识不随会话消失。

---

## 5. 必读文件清单（按优先级）

1. ✅ AGENTS.md（当前）
2. ✅ PROJECT_RULES.md
3. ✅ openspec/project.md
4. ✅ docs/workflows/feature-lifecycle.md
5. ✅ 当前 feature 的 proposal.md / tasks.md / runstate.md

---

## 6. 禁区

- ❌ 不允许跳过 spec 直接实现
- ❌ 不允许不更新 runstate 就继续工作
- ❌ 不允许随意改目录命名
- ❌ 不允许 feature 未完成就开新 feature（除非显式声明并行）

---

## 7. 快速开始

### 创建新 feature
```
使用 /feature-start 命令，提供 feature-id 和 feature-title
```

### 继续已有 feature
```
1. 读取 openspec/changes/<feature-id>/runstate.md
2. 根据当前阶段执行对应命令
3. 更新 runstate.md 记录进度
```

### 归档 feature
```
使用 /feature-archive 命令，确保 feature 已 completed
```
```

---

### Task 3: 创建 PROJECT_RULES.md

**Files:**
- Create: `PROJECT_RULES.md`

- [ ] **Step 1: 创建 PROJECT_RULES.md 文件**

```markdown
# PROJECT_RULES.md - 项目硬规则

本文档定义项目的强制性规则，所有 AI 执行者和人类开发者必须遵守。

---

## 1. OpenSpec 规则

### 1.1 规格先行
- **禁止跳过 proposal/spec/tasks 直接编码**
- 所有功能变更必须先在 `openspec/changes/<feature>/` 下定义规格

### 1.2 Feature 编号规范
- 格式: `NNN-semantic-name`
- 示例: `001-governance-foundation`, `002-user-auth`
- 序号必须连续，不得跳号

### 1.3 Spec 写法要求
- 必须包含: Overview, Requirements, Acceptance Scenarios
- 边界条件必须明确
- Out of Scope 必须列出

---

## 2. 执行规则

### 2.1 状态维护
- 每个阶段必须更新 `runstate.md`
- 阻塞点必须记录在 `Blockers` 字段

### 2.2 知识沉淀
- feature 完成后必须更新 `knowledge-index.md`
- 可复用模式必须记录到 `docs/knowledge/reusable-patterns.md`

### 2.3 提交规范
- 提交信息格式: `feat(<feature>): <description>`
- 示例: `feat(auth): add JWT token validation`

---

## 3. 测试规则

### 3.1 测试覆盖
- 所有新功能必须有测试
- Bug 修复必须有回归测试

### 3.2 验证要求
- `runstate.md` 必须记录最后验证时间
- 验证结果必须记录在 runstate 或 test-summary

---

## 4. 归档规则

### 4.1 归档条件
feature 满足以下条件才能归档:
- [ ] proposal 完整
- [ ] spec 完整
- [ ] tasks 全部关闭或标明 deferred
- [ ] runstate 已收尾
- [ ] implementation-summary 已完成
- [ ] lessons-learned 已完成
- [ ] knowledge-index 已更新

### 4.2 禁止事项
- 禁止删除 archive 目录下的任何文件
- 禁止修改已归档 feature 的 spec

---

## 5. 目录规则

### 5.1 目录稳定性
- 目录结构不得随意改动
- 新增目录需在 `openspec/conventions.md` 中记录

### 5.2 文件命名
- 使用小写字母和连字符
- 模板文件: `*.template.md`
- 运行状态: `runstate.md`

---

## 6. AI 执行边界

### 6.1 允许
- 按照 feature spec 执行任务
- 更新 runstate 和知识层
- 在 spec 范围内做技术决策

### 6.2 禁止
- 擅自改 feature 目标
- 擅自改变验收边界
- 擅自删除 spec 要求
- 在 spec 不完整时开始实现

---

## 7. 异常处理

### 7.1 Spec 不完整
发现 spec 不完整时:
1. 停止实现
2. 更新 spec
3. 获得用户确认
4. 继续实现

### 7.2 Design 不成立
发现 design 不成立时:
1. 记录问题到 runstate.Blockers
2. 提出替代方案
3. 更新 design.md
4. 获得用户确认

### 7.3 任务拆分不合理
发现任务拆分不合理时:
1. 更新 tasks.md
2. 更新 runstate
3. 继续
```

---

### Task 4: 更新 README.md

**Files:**
- Create: `README.md`

- [ ] **Step 1: 创建 README.md 文件**

```markdown
# Amazing Workflow

一套 OpenSpec + Superpowers 组合的项目治理框架，实现 AI 驱动的规范化研发闭环。

## 快速开始

### 对于 AI 助手

1. 阅读 `AGENTS.md` - 这是你的项目入口
2. 阅读 `PROJECT_RULES.md` - 了解项目硬规则
3. 阅读当前 feature 的 `runstate.md` - 了解当前状态

### 对于人类开发者

1. 阅读 `openspec/project.md` - 了解项目目标
2. 阅读 `docs/workflows/feature-lifecycle.md` - 了解工作流程
3. 使用 `/feature-start` 命令创建新 feature

## 目录结构

```
amazing-workflow/
├─ AGENTS.md              # AI 项目入口
├─ PROJECT_RULES.md       # 项目硬规则
├─ README.md              # 本文件
│
├─ openspec/              # OpenSpec 规格目录
│  ├─ project.md          # 项目目标
│  ├─ conventions.md      # 约定规则
│  ├─ templates/          # feature 模板
│  ├─ changes/            # 活跃 feature
│  └─ archive/            # 已归档 feature
│
├─ docs/                  # 项目文档
│  ├─ workflows/          # 工作流定义
│  ├─ knowledge/          # 知识沉淀
│  └─ standards/          # 工程规范
│
└─ .superpowers/          # Superpowers 配置
   ├─ context/            # 执行规则
   ├─ checklists/         # 检查清单
   └─ skills/             # skill 命令
```

## 核心特性

- ✅ **规格先行** - 所有实现基于明确的 spec
- ✅ **状态可续** - runstate.md 支持会话续接
- ✅ **知识沉淀** - feature 完成后自动同步知识层
- ✅ **命令可执行** - 7 个 skill 命令实现完整工作流

## 工作流程

```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

## 可用命令

| 命令 | 功能 |
|------|------|
| `/feature-start` | 创建新 feature |
| `/feature-spec` | 细化 feature 规格 |
| `/feature-tasks` | 拆解任务 |
| `/feature-implement` | 开始实现 |
| `/feature-verify` | 验证完成 |
| `/feature-close` | 收尾 feature |
| `/feature-archive` | 归档 feature |

## 文档

- [设计文档](docs/superpowers/specs/2026-04-09-governance-foundation-refined-design.md)
- [Feature 生命周期](docs/workflows/feature-lifecycle.md)
- [知识索引](docs/knowledge/knowledge-index.md)

## 许可证

MIT
```

---

## Phase C: OpenSpec 核心文件

### Task 5: 创建 openspec/project.md

**Files:**
- Create: `openspec/project.md`

- [ ] **Step 1: 创建 openspec/project.md 文件**

```markdown
# Project Overview

## 项目名称

Amazing Workflow

## 项目目标

建立一套 OpenSpec + Superpowers 组合的项目治理框架，使 AI 驱动开发具备：
- 规范化的需求入口
- 结构化的变更管理
- 可持续的知识沉淀

## 核心目标用户

1. **AI 开发助手** - 需要明确的规则和输入包来稳定执行
2. **项目维护者** - 需要可追溯的变更历史和知识沉淀
3. **新接手者** - 需要快速理解项目状态和上下文

## 总体原则

1. **规格先行** - 不跳过 spec 直接实现
2. **状态可续** - runstate 支持会话续接
3. **知识沉淀** - 每个 feature 都沉淀经验
4. **目录稳定** - 命名和结构保持一致

## 技术栈

- Markdown 文档
- OpenCode skill 定义
- Git 版本控制

## 当前阶段

- [x] Phase 1: 治理骨架搭建
- [ ] Phase 2: 增强能力
- [ ] Phase 3: 高级自动化

## 相关文档

- [AGENTS.md](../AGENTS.md) - AI 入口
- [PROJECT_RULES.md](../PROJECT_RULES.md) - 项目规则
- [conventions.md](./conventions.md) - OpenSpec 约定
```

---

### Task 6: 创建 openspec/conventions.md

**Files:**
- Create: `openspec/conventions.md`

- [ ] **Step 1: 创建 openspec/conventions.md 文件**

```markdown
# OpenSpec Conventions

本文档定义 OpenSpec 侧的统一约定。

---

## 1. Feature 编号规范

### 格式
```
NNN-semantic-name
```

### 示例
- `001-governance-foundation`
- `002-user-auth`
- `003-session-management`

### 规则
- 序号从 001 开始，连续递增
- 使用小写字母和连字符
- 语义名称简洁明了（2-4 个单词）

---

## 2. Spec 写法规范

### 必需字段

```markdown
## Overview
<!-- 功能概述 -->

## Requirements
<!-- 功能需求列表 -->

## Acceptance Scenarios
<!-- 验收场景（Given/When/Then） -->

## Edge Cases
<!-- 边界情况 -->

## Constraints
<!-- 约束条件 -->

## Out of Scope
<!-- 不包含的内容 -->
```

### 写法要求
- 使用主动语态
- 需求可验证
- 场景具体化

---

## 3. Proposal 写法规范

### 必需字段

```markdown
## 背景
<!-- 为什么需要这个 feature -->

## 问题陈述
<!-- 要解决什么问题 -->

## 目标
<!-- 要达成什么 -->

## 非目标
<!-- 明确不做什么 -->

## 成功标准
<!-- 如何判断成功 -->
```

---

## 4. Tasks 写法规范

### 任务格式

```markdown
### Task N: 任务标题

- **目标**: 这个任务要达成什么
- **输入**: 需要什么输入
- **输出**: 产出什么
- **验证**: 如何验证完成
- **依赖**: 依赖哪些任务
- **状态**: pending | in_progress | completed
```

### 任务粒度
- 每个任务 2-5 分钟可完成
- 任务独立可验证
- 任务间依赖明确

---

## 5. Runstate 写法规范

### 必需字段

```markdown
| 字段 | 值 |
|------|-----|
| 当前阶段 | proposed | specified | planned | implementing | verifying | completed |
| 已完成 | 已完成的任务列表 |
| 进行中 | 正在进行的任务 |
| 待处理 | 待处理的任务 |
| 阻塞点 | 当前阻塞（如有） |
| 下一步动作 | 下一步要做什么 |
```

### 更新规则
- 每个阶段必须更新
- 阻塞时必须记录
- 下一步动作必须明确

---

## 6. 命名规范

### 文件命名
- `proposal.md` - feature 提案
- `tasks.md` - 任务清单
- `runstate.md` - 运行状态
- `spec.md` - 规格文档
- `design.md` - 设计文档

### 目录命名
- `openspec/changes/NNN-name/` - 活跃 feature
- `openspec/archive/NNN-name/` - 已归档 feature
- `specs/domain/` - spec 子目录

---

## 7. 归档规则

### 归档检查清单
- [ ] proposal 完整
- [ ] spec 完整
- [ ] tasks 全部关闭
- [ ] runstate 已收尾
- [ ] summary 已完成
- [ ] knowledge-index 已更新

### 归档流程
1. 确认所有检查项完成
2. 移动目录到 `openspec/archive/`
3. 更新 `knowledge-index.md`

---

## 8. 模板位置

所有模板存放在 `openspec/templates/`:
- `proposal.template.md`
- `tasks.template.md`
- `runstate.template.md`
```

---

### Task 7: 创建 proposal.template.md

**Files:**
- Create: `openspec/templates/proposal.template.md`

- [ ] **Step 1: 创建 proposal.template.md 文件**

```markdown
# Feature Proposal

## 元信息

- **Feature ID**: {feature-id}
- **创建日期**: {date}
- **状态**: proposed
- **作者**: {author}

---

## 1. 背景

<!-- 描述为什么需要这个 feature，提供上下文 -->

## 2. 问题陈述

<!-- 清晰描述要解决的问题，用一两句话概括 -->

## 3. 目标

<!-- 这个 feature 要达成什么，列出具体目标 -->

- 目标 1: ...
- 目标 2: ...

## 4. 非目标

<!-- 明确不包含什么，防止范围蔓延 -->

- 不做 ...
- 不做 ...

## 5. 成功标准

<!-- 如何判断这个 feature 成功完成 -->

- [ ] 标准 1: ...
- [ ] 标准 2: ...

## 6. 影响范围

<!-- 涉及哪些模块/系统/文件 -->

- 模块 A: ...
- 模块 B: ...

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 风险 1 | 高/中/低 | ... |

---

## 审批

- [ ] Proposal 已评审
- [ ] 可进入 spec 阶段
```

---

### Task 8: 创建 tasks.template.md

**Files:**
- Create: `openspec/templates/tasks.template.md`

- [ ] **Step 1: 创建 tasks.template.md 文件**

```markdown
# Feature Tasks

## 元信息

- **Feature ID**: {feature-id}
- **更新日期**: {date}
- **状态**: planned

---

## 任务列表

### Task 1: {task-title}

- **目标**: {goal}
- **输入**: {inputs}
- **输出**: {outputs}
- **验证**: {verification}
- **依赖**: 无
- **状态**: pending

### Task 2: {task-title}

- **目标**: {goal}
- **输入**: {inputs}
- **输出**: {outputs}
- **验证**: {verification}
- **依赖**: Task 1
- **状态**: pending

---

## 任务依赖图

```
Task 1 → Task 2 → Task 3
    └→ Task 4
```

---

## 进度统计

- 总任务数: {N}
- 已完成: 0
- 进行中: 0
- 待处理: {N}
```

---

### Task 9: 创建 runstate.template.md

**Files:**
- Create: `openspec/templates/runstate.template.md`

- [ ] **Step 1: 创建 runstate.template.md 文件**

```markdown
# Feature Runstate

## 元信息

- **Feature ID**: {feature-id}
- **更新日期**: {date}
- **更新者**: {agent-or-user}
- **当前阶段**: proposed

---

## 当前状态

| 字段 | 值 |
|------|-----|
| 当前阶段 | proposed |
| 已完成 | - |
| 进行中 | - |
| 待处理 | proposal 待填写 |
| 阻塞点 | - |
| 下一步动作 | 填写 proposal.md |

---

## 重要文件

<!-- 记录本次 feature 关键文件路径 -->

- `openspec/changes/{feature-id}/proposal.md`
- `openspec/changes/{feature-id}/tasks.md`

---

## 变更历史

| 日期 | 阶段变更 | 备注 |
|------|----------|------|
| {date} | idea → proposed | feature 初始化 |

---

## 最后验证时间

<!-- 记录上次验证的时间戳 -->

- 暂无验证记录
```

---

## Phase D: Superpowers 规则文件

### Task 10: 创建 execution-rules.md

**Files:**
- Create: `.superpowers/context/execution-rules.md`

- [ ] **Step 1: 创建 execution-rules.md 文件**

```markdown
# Superpowers Execution Rules

本文档定义 Superpowers 在本项目中的执行规则。

---

## 1. 固定输入包

每次实现开始前，必须加载以下文件：

### 必须加载
1. `AGENTS.md` - 项目入口
2. `PROJECT_RULES.md` - 项目规则
3. `openspec/project.md` - 项目目标
4. 当前 feature 的:
   - `proposal.md`
   - `tasks.md`
   - `runstate.md`
   - `specs/*/spec.md`（如存在）

### 推荐加载
- `docs/workflows/feature-lifecycle.md`
- `docs/knowledge/knowledge-index.md`

---

## 2. 执行边界

### 允许
- 按 tasks.md 顺序执行
- 在 spec 范围内做技术决策
- 更新 runstate.md
- 更新知识层

### 禁止
- 跳过 spec 直接实现
- 擅自改 feature 目标
- 擅自删除 spec 要求
- 不更新 runstate 就继续

---

## 3. 状态更新规则

### 每完成一个任务
1. 更新 `tasks.md` 中任务状态
2. 更新 `runstate.md` 当前状态
3. 如遇阻塞，记录到 `Blockers` 字段

### 每完成一个阶段
1. 更新 `runstate.md` 当前阶段
2. 记录变更历史

---

## 4. 异常处理

### Spec 不完整
```
停止 → 更新 spec → 获得确认 → 继续
```

### Design 不成立
```
记录问题 → 提出方案 → 更新 design → 获得确认
```

### 任务拆分不合理
```
更新 tasks.md → 更新 runstate → 继续
```

---

## 5. 提交规范

### 提交信息格式
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### 类型
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `refactor`: 重构
- `test`: 测试
- `chore`: 其他

---

## 6. 验证规则

### 实现阶段结束前
- [ ] 代码可编译/运行
- [ ] 测试通过
- [ ] runstate 已更新

### 收尾阶段
- [ ] implementation-summary 完成
- [ ] lessons-learned 完成
- [ ] knowledge-index 已更新
```

---

### Task 11: 创建 implementation-checklist.md

**Files:**
- Create: `.superpowers/checklists/implementation-checklist.md`

- [ ] **Step 1: 创建 implementation-checklist.md 文件**

```markdown
# Implementation Checklist

每个 feature 实现完成后，必须通过此检查清单。

---

## 提交前检查

### 代码质量
- [ ] 代码可编译/运行
- [ ] 无明显性能问题
- [ ] 错误处理完整
- [ ] 日志/注释适当

### 测试覆盖
- [ ] 新功能有测试
- [ ] 边界情况有测试
- [ ] 测试通过

### 文档更新
- [ ] runstate.md 已更新
- [ ] API 文档已更新（如有）
- [ ] README 已更新（如有）

---

## 收尾前检查

### 规格一致性
- [ ] 实现与 spec 一致
- [ ] 如有偏差已更新 spec 并说明原因

### 状态文件
- [ ] tasks.md 所有任务已关闭
- [ ] runstate.md 已收尾
- [ ] implementation-summary 已完成
- [ ] lessons-learned 已完成

### 知识沉淀
- [ ] 可复用模式已记录
- [ ] 常见问题已记录
- [ ] knowledge-index.md 已更新

---

## 归档前检查

- [ ] proposal 完整
- [ ] spec 完整
- [ ] tasks 全部关闭
- [ ] runstate 已收尾
- [ ] summary 已完成
- [ ] lessons-learned 已完成
- [ ] knowledge-index 已更新
- [ ] 目录已移动到 archive
```

---

## Phase E: Skill 命令定义

### Task 12: 创建 feature-start.md

**Files:**
- Create: `.superpowers/skills/feature-start.md`

- [ ] **Step 1: 创建 feature-start.md 文件**

```markdown
---
name: feature-start
description: "创建新的 feature 目录并初始化基础文件"
---

# /feature-start

创建新的 feature 目录并初始化基础文件。

## 功能

创建 `openspec/changes/<feature-id>/` 目录结构，生成基于模板的基础文件。

## 输入

- `feature-id`: 三位序号+语义名称（如 `002-user-auth`）
- `feature-title`: feature 标题

## 输出

- `openspec/changes/<feature-id>/proposal.md`（基于模板）
- `openspec/changes/<feature-id>/tasks.md`（基于模板）
- `openspec/changes/<feature-id>/runstate.md`（初始状态）
- `openspec/changes/<feature-id>/specs/`（空目录）

## 执行步骤

1. **验证 feature-id 格式**
   - 必须是 `NNN-semantic-name` 格式
   - 序号必须连续

2. **检查是否已存在同名目录**
   - 如存在，提示用户选择不同名称

3. **创建目录结构**
   ```
   mkdir -p openspec/changes/<feature-id>/specs
   ```

4. **复制模板文件**
   - 复制 `proposal.template.md` → `proposal.md`
   - 复制 `tasks.template.md` → `tasks.md`
   - 复制 `runstate.template.md` → `runstate.md`

5. **替换模板变量**
   - `{feature-id}` → 实际 feature-id
   - `{date}` → 当前日期
   - `{task-title}` → feature-title

6. **初始化 runstate**
   - 当前阶段: `proposed`
   - 下一步动作: 填写 proposal.md

7. **提示用户**
   - 请填写 `proposal.md` 中的背景、问题、目标等字段

## 示例

```
输入: feature-id=002-logging-system, feature-title=日志系统

输出:
- 创建 openspec/changes/002-logging-system/
- 生成 proposal.md, tasks.md, runstate.md
- 创建 specs/ 空目录
```

## 错误处理

- feature-id 格式错误 → 提示正确格式
- 目录已存在 → 提示选择不同名称
- 模板文件不存在 → 先检查模板目录
```

---

### Task 13: 创建 feature-spec.md

**Files:**
- Create: `.superpowers/skills/feature-spec.md`

- [ ] **Step 1: 创建 feature-spec.md 文件**

```markdown
---
name: feature-spec
description: "校验 proposal 并生成 specs 子目录"
---

# /feature-spec

校验 proposal 并生成 specs 子目录。

## 功能

读取并校验 proposal.md，为每个子域创建 spec.md 模板。

## 输入

- `feature-id`: 已存在的 feature 目录

## 输出

- `openspec/changes/<feature-id>/specs/<domain>/spec.md`
- 校验报告

## 执行步骤

1. **读取 proposal.md**
   - 检查必需字段是否存在
   - 目标、问题陈述、成功标准必须填写

2. **校验必需字段**
   - 背景 ✓/✗
   - 问题陈述 ✓/✗
   - 目标 ✓/✗
   - 成功标准 ✓/✗

3. **询问用户需要的 spec 子目录**
   - "请列出需要创建的 spec 子域（如 auth, api, ui）"

4. **创建 spec 子目录和文件**
   ```
   mkdir -p openspec/changes/<feature-id>/specs/<domain>
   创建 spec.md 模板
   ```

5. **更新 runstate**
   - 当前阶段: `specified`
   - 下一步动作: 填写 spec 内容

## Spec 模板

```markdown
# Spec: {domain}

## Overview
<!-- 功能概述 -->

## Requirements
<!-- 功能需求 -->

## Acceptance Scenarios
<!-- 验收场景 -->

## Edge Cases
<!-- 边界情况 -->

## Constraints
<!-- 约束条件 -->

## Out of Scope
<!-- 不包含的内容 -->
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 校验 proposal.md 通过
- 创建 specs/logging/spec.md
- 更新 runstate 为 specified
```
```

---

### Task 14: 创建 feature-tasks.md

**Files:**
- Create: `.superpowers/skills/feature-tasks.md`

- [ ] **Step 1: 创建 feature-tasks.md 文件**

```markdown
---
name: feature-tasks
description: "基于 proposal/spec 生成任务清单"
---

# /feature-tasks

基于 proposal/spec 生成任务清单。

## 功能

读取 proposal.md 和所有 spec.md，生成按依赖排序的任务列表。

## 输入

- `feature-id`: 已存在的 feature 目录

## 输出

- 更新后的 `tasks.md`

## 执行步骤

1. **读取所有规格文件**
   - proposal.md
   - specs/*/spec.md

2. **分析需求生成任务**
   - 每个需求映射到一个或多个任务
   - 任务粒度: 2-5 分钟可完成

3. **识别任务依赖关系**
   - 哪些任务必须先完成
   - 哪些任务可以并行

4. **生成任务列表**
   - 按依赖顺序排列
   - 每个任务包含: 目标、输入、输出、验证、依赖、状态

5. **更新 runstate**
   - 当前阶段: `planned`
   - 下一步动作: 执行 `/feature-implement`

## 任务格式

```markdown
### Task N: 任务标题

- **目标**: 这个任务要达成什么
- **输入**: 需要什么输入
- **输出**: 产出什么
- **验证**: 如何验证完成
- **依赖**: 依赖哪些任务
- **状态**: pending
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 更新 tasks.md
- 任务列表:
  Task 1: 创建日志配置文件
  Task 2: 实现日志写入器
  Task 3: 添加日志格式化
  Task 4: 编写测试
- 更新 runstate 为 planned
```
```

---

### Task 15: 创建 feature-implement.md

**Files:**
- Create: `.superpowers/skills/feature-implement.md`

- [ ] **Step 1: 创建 feature-implement.md 文件**

```markdown
---
name: feature-implement
description: "加载固定输入包并按 tasks 执行"
---

# /feature-implement

加载固定输入包并按 tasks 执行。

## 功能

加载必要的项目文件，按 tasks.md 顺序逐个执行任务。

## 输入

- `feature-id`: 已存在的 feature 目录

## 输出

- 实现代码
- 更新后的 `runstate.md`

## 执行步骤

1. **加载固定输入包**
   - AGENTS.md
   - PROJECT_RULES.md
   - openspec/project.md
   - 当前 feature 的 proposal/specs/tasks/runstate

2. **读取 tasks.md**
   - 获取当前应执行的任务

3. **逐个执行任务**
   - 按顺序执行
   - 每完成一个任务:
     - 更新 tasks.md 任务状态
     - 更新 runstate.md

4. **处理阻塞**
   - 如遇阻塞，记录到 runstate.Blockers
   - 询问用户如何处理

5. **阶段完成**
   - 所有任务完成
   - 更新 runstate 为 `implementing` 完成

## 固定输入包清单

```
必读文件:
├─ AGENTS.md
├─ PROJECT_RULES.md
├─ openspec/project.md
└─ openspec/changes/<feature-id>/
   ├─ proposal.md
   ├─ tasks.md
   ├─ runstate.md
   └─ specs/*/spec.md
```

## 状态更新

每个任务完成后:
```markdown
| 字段 | 值 |
|------|-----|
| 已完成 | Task 1, Task 2 |
| 进行中 | Task 3 |
| 待处理 | Task 4, Task 5 |
```

## 示例

```
输入: feature-id=002-logging-system

执行:
1. 加载输入包
2. 读取 tasks.md
3. 执行 Task 1 → 更新状态
4. 执行 Task 2 → 更新状态
5. ...

输出:
- 实现代码文件
- 更新后的 runstate.md
```
```

---

### Task 16: 创建 feature-verify.md

**Files:**
- Create: `.superpowers/skills/feature-verify.md`

- [ ] **Step 1: 创建 feature-verify.md 文件**

```markdown
---
name: feature-verify
description: "执行测试并生成验证报告"
---

# /feature-verify

执行测试并生成验证报告。

## 功能

执行项目测试命令，检查覆盖率，记录验证结果。

## 输入

- `feature-id`: 已实现的 feature

## 输出

- 测试执行结果
- 验证报告（写入 runstate）

## 执行步骤

1. **执行测试命令**
   - 运行项目的测试脚本
   - 记录测试结果

2. **检查覆盖率**
   - 新功能是否有测试
   - 边界情况是否覆盖

3. **验证成功标准**
   - 对照 proposal.md 的成功标准
   - 逐项检查是否满足

4. **记录验证结果**
   - 写入 runstate 的验证记录
   - 标记已知缺口

5. **更新 runstate**
   - 当前阶段: `verifying`
   - 如全部通过: 可进入 `completed`

## 验证记录格式

```markdown
## 验证记录

- **日期**: {date}
- **测试结果**: 通过/失败
- **覆盖率**: {percentage}
- **已知缺口**:
  - 缺口 1: ...
  - 缺口 2: ...
```

## 示例

```
输入: feature-id=002-logging-system

执行:
1. 运行测试
2. 检查覆盖率
3. 验证成功标准

输出:
- 测试通过
- 覆盖率 85%
- 已知缺口: 边界情况测试不足
- 更新 runstate
```
```

---

### Task 17: 创建 feature-close.md

**Files:**
- Create: `.superpowers/skills/feature-close.md`

- [ ] **Step 1: 创建 feature-close.md 文件**

```markdown
---
name: feature-close
description: "收尾 feature，生成总结并更新知识索引"
---

# /feature-close

收尾 feature，生成总结并更新知识索引。

## 功能

生成 implementation-summary 和 lessons-learned，同步知识到 knowledge-index。

## 输入

- `feature-id`: 已验证的 feature

## 输出

- implementation-summary（写入 runstate）
- lessons-learned（写入 runstate）
- 更新后的 `knowledge-index.md`

## 执行步骤

1. **生成实现总结**
   - 实际完成了什么
   - 与设计的偏差
   - 新增/修改文件清单

2. **提取经验教训**
   - 成功做法
   - 失败点
   - 可复用模式

3. **更新知识索引**
   - 添加 feature 记录
   - 同步可复用模式
   - 同步常见问题

4. **更新 runstate**
   - 当前阶段: `completed`
   - 标记完成时间

## Summary 格式

```markdown
## Implementation Summary

- **完成日期**: {date}
- **实际完成**:
  - 功能 1
  - 功能 2
- **偏离设计**:
  - 偏差 1: 原因
- **文件变更**:
  - 新增: file1, file2
  - 修改: file3

## Lessons Learned

- **成功做法**: ...
- **失败点**: ...
- **可复用模式**: ...
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 生成 implementation-summary
- 生成 lessons-learned
- 更新 knowledge-index.md
- 更新 runstate 为 completed
```
```

---

### Task 18: 创建 feature-archive.md

**Files:**
- Create: `.superpowers/skills/feature-archive.md`

- [ ] **Step 1: 创建 feature-archive.md 文件**

```markdown
---
name: feature-archive
description: "归档 feature"
---

# /feature-archive

归档 feature。

## 功能

检查 feature 是否满足归档条件，移动到 archive 目录，更新知识索引。

## 输入

- `feature-id`: 已完成的 feature

## 输出

- 移动目录到 `openspec/archive/<feature-id>/`
- 更新后的 `knowledge-index.md`

## 执行步骤

1. **检查归档条件**
   - [ ] proposal 完整
   - [ ] spec 完整
   - [ ] tasks 全部关闭
   - [ ] runstate 已收尾
   - [ ] summary 已完成
   - [ ] knowledge-index 已更新

2. **处理未满足条件**
   - 如有条件未满足，提示用户先完成

3. **移动目录**
   ```
   mv openspec/changes/<feature-id> openspec/archive/<feature-id>
   ```

4. **更新知识索引**
   - 添加归档记录
   - 更新 feature 状态

5. **更新 runstate**
   - 当前阶段: `archived`

## 归档记录格式

```markdown
## 归档记录

- **Feature ID**: {feature-id}
- **归档日期**: {date}
- **主要贡献**: ...
- **相关模式**: ...
```

## 示例

```
输入: feature-id=002-logging-system

检查:
- proposal 完整 ✓
- spec 完整 ✓
- tasks 全部关闭 ✓
- runstate 已收尾 ✓
- summary 已完成 ✓
- knowledge-index 已更新 ✓

执行:
- 移动到 openspec/archive/002-logging-system/
- 更新 knowledge-index.md
- 更新 runstate 为 archived
```
```

---

## Phase F: 知识层与工作流

### Task 19: 创建 knowledge-index.md

**Files:**
- Create: `docs/knowledge/knowledge-index.md`

- [ ] **Step 1: 创建 knowledge-index.md 文件**

```markdown
# Knowledge Index

项目知识沉淀索引。每个 feature 完成后更新此文件。

---

## Feature 索引

| Feature ID | 名称 | 状态 | 完成日期 | 主要贡献 |
|------------|------|------|----------|----------|
| 001-governance-foundation | 治理骨架 | completed | 2026-04-09 | 建立项目治理框架 |

---

## 可复用模式

### 模式 1: Feature 生命周期管理

**来源**: 001-governance-foundation

**模式描述**:
使用 runstate.md 作为 AI 会话续接的关键文件，记录当前阶段、已完成项、阻塞点和下一步动作。

**适用场景**:
- 所有 feature 的状态追踪
- AI 会话中断后恢复

---

### 模式 2: 规格先行

**来源**: 001-governance-foundation

**模式描述**:
所有功能变更必须先定义 proposal/spec/tasks，不得跳过规格直接编码。

**适用场景**:
- 所有新功能开发
- Bug 修复（需要 mini-proposal）

---

## 常见问题

### 问题 1: AI 会话中断后如何恢复？

**解决方案**:
1. 读取 `AGENTS.md` 了解项目结构
2. 读取当前 feature 的 `runstate.md`
3. 根据"下一步动作"继续执行

---

### 问题 2: Spec 与实现不一致怎么办？

**解决方案**:
1. 停止实现
2. 更新 spec 并说明原因
3. 获得用户确认
4. 继续实现

---

## 决策历史

| 日期 | 决策 | 原因 |
|------|------|------|
| 2026-04-09 | 采用精简版目录结构 | 第一阶段最小可用原则 |

---

## 更新记录

| 日期 | Feature | 更新内容 |
|------|---------|----------|
| 2026-04-09 | 001-governance-foundation | 初始化知识索引 |
```

---

### Task 20: 创建 feature-lifecycle.md

**Files:**
- Create: `docs/workflows/feature-lifecycle.md`

- [ ] **Step 1: 创建 feature-lifecycle.md 文件**

```markdown
# Feature Lifecycle

本文档定义 feature 从创建到归档的完整生命周期。

---

## 生命周期阶段

```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

---

## 阶段详情

### 1. idea → proposed

**触发**: 用户提出新需求

**命令**: `/feature-start`

**产出**:
- `openspec/changes/<feature-id>/proposal.md`
- `openspec/changes/<feature-id>/tasks.md`（空模板）
- `openspec/changes/<feature-id>/runstate.md`
- `openspec/changes/<feature-id>/specs/`（空目录）

**检查点**:
- [ ] feature-id 格式正确
- [ ] 目录已创建
- [ ] proposal 已填写

---

### 2. proposed → specified

**触发**: proposal 完成并评审通过

**命令**: `/feature-spec`

**产出**:
- `openspec/changes/<feature-id>/specs/<domain>/spec.md`
- proposal 校验报告

**检查点**:
- [ ] proposal 必需字段完整
- [ ] spec 子目录已创建
- [ ] spec 内容已填写

---

### 3. specified → planned

**触发**: spec 完成并评审通过

**命令**: `/feature-tasks`

**产出**:
- 更新后的 `tasks.md`（包含任务列表）

**检查点**:
- [ ] 任务粒度合适（2-5 分钟）
- [ ] 任务依赖关系明确
- [ ] 每个任务可验证

---

### 4. planned → implementing

**触发**: tasks 完成并准备开始实现

**命令**: `/feature-implement`

**产出**:
- 实现代码
- 更新后的 `runstate.md`

**检查点**:
- [ ] 固定输入包已加载
- [ ] 每个任务完成后更新状态
- [ ] 阻塞点已记录

---

### 5. implementing → verifying

**触发**: 实现完成

**命令**: `/feature-verify`

**产出**:
- 测试执行结果
- 验证报告

**检查点**:
- [ ] 测试通过
- [ ] 成功标准满足
- [ ] 已知缺口已记录

---

### 6. verifying → completed

**触发**: 验证通过

**命令**: `/feature-close`

**产出**:
- implementation-summary
- lessons-learned
- 更新后的 `knowledge-index.md`

**检查点**:
- [ ] summary 已完成
- [ ] lessons 已提取
- [ ] 知识索引已更新

---

### 7. completed → archived

**触发**: feature 完成并准备归档

**命令**: `/feature-archive`

**产出**:
- 移动到 `openspec/archive/<feature-id>/`
- 更新后的 `knowledge-index.md`

**检查点**:
- [ ] 所有归档条件满足
- [ ] 目录已移动
- [ ] 归档记录已添加

---

## 状态转换图

```
                    ┌─────────────────────────────────────────────────┐
                    │                                                 │
                    ▼                                                 │
idea ─────► proposed ─────► specified ─────► planned ─────► implementing
                                                              │
                                                              │
                                                              ▼
archived ◄──── completed ◄──── verifying ◄────────────────────┘
```

---

## 必读文件映射

| 阶段 | 必读文件 |
|------|----------|
| proposed | AGENTS.md, PROJECT_RULES.md, proposal.md |
| specified | proposal.md, specs/*/spec.md |
| planned | proposal.md, specs/*/spec.md, tasks.md |
| implementing | 全部输入包 |
| verifying | runstate.md, tasks.md |
| completed | runstate.md, implementation-summary |
| archived | knowledge-index.md |
```

---

### Task 21: 创建 coding-standards.md 占位文件

**Files:**
- Create: `docs/standards/coding-standards.md`

- [ ] **Step 1: 创建 coding-standards.md 文件**

```markdown
# Coding Standards

本文档定义项目的编码规范。

---

## 状态

📝 占位文件 - 待后续补充

---

## 预定内容

- 代码风格
- 命名规范
- 注释规范
- 文件组织
- 错误处理
- 日志规范

---

## 参考

待项目确定技术栈后补充具体规范。
```

---

## Phase G: 验证与提交

### Task 22: 验证文件完整性

**Files:**
- 检查所有已创建文件

- [ ] **Step 1: 检查目录结构**

```bash
ls -la
ls -la openspec/
ls -la openspec/templates/
ls -la docs/
ls -la docs/knowledge/
ls -la docs/workflows/
ls -la docs/standards/
ls -la .superpowers/
ls -la .superpowers/context/
ls -la .superpowers/checklists/
ls -la .superpowers/skills/
```

- [ ] **Step 2: 检查文件数量**

预期文件数量: 19 个

- [ ] **Step 3: 提交所有文件**

```bash
git add .
git commit -m "feat(governance): add governance foundation skeleton

- Add AGENTS.md as AI entry point
- Add PROJECT_RULES.md with hard rules
- Add openspec templates (proposal, tasks, runstate)
- Add Superpowers execution rules and checklists
- Add 7 skill command definitions
- Add knowledge-index and feature-lifecycle docs
- Add README with quick start guide"
```

---

## 计划自检

### Spec 覆盖检查

| Spec 要求 | 对应任务 | 状态 |
|-----------|----------|------|
| 根目录治理文件 | Task 2, 3, 4 | ✓ |
| OpenSpec 核心文件 | Task 5, 6, 7, 8, 9 | ✓ |
| 知识层文件 | Task 19 | ✓ |
| Superpowers 规则文件 | Task 10, 11 | ✓ |
| Skill 定义文件 | Task 12-18 | ✓ |
| 工作流文件 | Task 20 | ✓ |

### 占位符检查

- ✅ 无 TBD/TODO
- ✅ 所有代码块包含实际内容
- ✅ 所有文件路径明确

### 类型一致性检查

- ✅ feature-id 格式一致 (NNN-semantic-name)
- ✅ 生命周期阶段名称一致
- ✅ 文件命名一致

---

## 执行选项

计划完成并保存到 `docs/superpowers/plans/2026-04-09-governance-foundation.md`

**两种执行方式：**

1. **Subagent-Driven（推荐）** - 派发独立 subagent 执行每个任务，任务间有审查
2. **Inline Execution** - 在当前会话批量执行，有检查点

**你想用哪种方式？**