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