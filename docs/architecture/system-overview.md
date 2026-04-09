# System Overview

本文档描述 Amazing Workflow 项目的整体架构。

---

## 1. 系统边界

Amazing Workflow 是一套 **AI 驱动的项目治理框架**，核心能力：

| 能力 | 描述 |
|------|------|
| 变更管理 | 通过 Feature 生命周期管理功能变更 |
| 规格驱动 | 所有实现基于明确的 OpenSpec 规格定义 |
| 执行编排 | Superpowers 提供标准化的执行流程 |
| 知识沉淀 | 自动将经验沉淀到项目知识层 |

### 系统边界图

```
┌─────────────────────────────────────────────────────────────┐
│                    Amazing Workflow                         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  OpenSpec   │    │ Superpowers │    │   Knowledge │     │
│  │  (规格层)   │───▶│  (执行层)   │───▶│   (知识层)  │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│         │                  │                  │             │
│         ▼                  ▼                  ▼             │
│  ┌──────────────────────────────────────────────────┐      │
│  │              Feature Lifecycle                    │      │
│  │  idea → proposed → specified → planned →         │      │
│  │  implementing → verifying → completed → archived │      │
│  └──────────────────────────────────────────────────┘      │
└─────────────────────────────────────────────────────────────┘
```

---

## 2. 模块职责

### 2.1 OpenSpec 模块

**职责**: 变更定义与归档

| 子模块 | 职责 |
|--------|------|
| `openspec/project.md` | 项目级目标与范围定义 |
| `openspec/conventions.md` | OpenSpec 约定规则 |
| `openspec/templates/` | Feature 文档模板 |
| `openspec/changes/` | 活跃 Feature 目录 |
| `openspec/archive/` | 已归档 Feature 目录 |

**核心文件**:
- `proposal.md` - 定义"为什么要做"
- `specs/*/spec.md` - 定义"系统应该表现成什么样"
- `tasks.md` - 定义"要分几步完成"
- `runstate.md` - 定义"现在做到哪了"

### 2.2 Superpowers 模块

**职责**: 执行与验证

| 子模块 | 职责 |
|--------|------|
| `.superpowers/context/` | 执行规则与约束 |
| `.superpowers/checklists/` | 检查清单 |
| `.superpowers/skills/` | 可执行命令定义 |

**核心 Skills**:
| Skill | 阶段 | 职责 |
|-------|------|------|
| `feature-start` | idea → proposed | 创建 Feature 目录和初始文件 |
| `feature-spec` | proposed → specified | 校验 proposal，创建 spec |
| `feature-tasks` | specified → planned | 生成任务列表 |
| `feature-implement` | planned → implementing | 执行任务实现 |
| `feature-verify` | implementing → verifying | 验证测试通过 |
| `feature-close` | verifying → completed | 生成总结，更新知识 |
| `feature-archive` | completed → archived | 归档 Feature |

### 2.3 Knowledge 模块

**职责**: 知识沉淀与复用

| 子模块 | 职责 |
|--------|------|
| `docs/knowledge/` | 跨 Feature 知识沉淀 |
| `docs/workflows/` | 工作流定义 |
| `docs/standards/` | 工程规范 |
| `docs/architecture/` | 架构文档 |
| `docs/domain/` | 领域知识 |

---

## 3. 调用关系

### 3.1 Feature 生命周期调用链

```
用户需求
    │
    ▼
/feature-start ────────▶ 创建 proposal.md, runstate.md
    │
    ▼
/feature-spec ─────────▶ 创建 specs/*/spec.md
    │
    ▼
/feature-tasks ────────▶ 更新 tasks.md
    │
    ▼
/feature-implement ────▶ 实现代码，更新 runstate.md
    │
    ▼
/feature-verify ───────▶ 执行测试，记录结果
    │
    ▼
/feature-close ────────▶ 生成 summary，更新 knowledge-index.md
    │
    ▼
/feature-archive ──────▶ 移动到 archive/
```

### 3.2 AI 读取流程

```
AI 进入项目
    │
    ▼
读取 AGENTS.md ────────▶ 获取项目概述、目录结构、规则
    │
    ▼
读取 PROJECT_RULES.md ─▶ 获取项目硬规则
    │
    ▼
读取 openspec/project.md▶ 获取项目目标
    │
    ▼
读取 feature/runstate.md▶ 获取当前状态
    │
    ▼
执行下一步动作
```

---

## 4. 数据流

### 4.1 Feature 数据流

```
┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
│ Proposal │───▶│   Spec   │───▶│  Tasks   │───▶│ Runstate │
│ (需求)   │    │ (规格)   │    │ (任务)   │    │ (状态)   │
└──────────┘    └──────────┘    └──────────┘    └──────────┘
                                         │
                                         ▼
                                  ┌──────────┐
                                  │  Code    │
                                  │ (实现)   │
                                  └──────────┘
                                         │
                                         ▼
┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
│ Knowledge│◀───│ Lessons  │◀───│ Summary  │◀───│  Test    │
│ (知识)   │    │ (经验)   │    │ (总结)   │    │ (测试)   │
└──────────┘    └──────────┘    └──────────┘    └──────────┘
```

### 4.2 知识沉淀流

```
Feature 完成
    │
    ▼
lessons-learned.md ────▶ 提取可复用模式
    │
    ▼
knowledge-index.md ────▶ 更新知识索引
    │
    ▼
docs/knowledge/ ───────▶ 沉淀项目知识
```

---

## 5. 集成方式

### 5.1 与 OpenCode 集成

```
OpenCode
    │
    ├── 读取 AGENTS.md (项目入口)
    │
    ├── 调用 /feature-* skills
    │
    └── 更新 runstate.md (会话续接)
```

### 5.2 与 Git 集成

```
Feature Lifecycle
    │
    ├── feature-start: 创建分支
    │
    ├── feature-implement: 提交代码
    │
    └── feature-close: 合并/归档
```

### 5.3 与外部工具集成（规划中）

| 工具 | 集成点 | 状态 |
|------|--------|------|
| CI/CD | feature-verify | 规划中 |
| Issue Tracker | feature-start | 规划中 |
| Knowledge Graph | knowledge-index | 规划中 |

---

## 6. 架构原则

### 6.1 分层职责

| 层 | 职责 | 文件位置 |
|-----|------|----------|
| 规格层 | 定义"做什么" | `openspec/` |
| 执行层 | 定义"怎么做" | `.superpowers/` |
| 知识层 | 沉淀"学到了什么" | `docs/knowledge/` |

### 6.2 设计原则

1. **规格先行** - 不得跳过 proposal/spec/tasks 直接编码
2. **状态可续** - runstate.md 支持会话续接
3. **知识沉淀** - 每个 Feature 都沉淀经验
4. **命令可执行** - Skill 命令有明确定义

---

## 7. 目录结构速查

```
amazing-workflow/
├─ AGENTS.md              # AI 入口
├─ PROJECT_RULES.md       # 项目规则
├─ README.md              # 人类入口
│
├─ openspec/              # OpenSpec 规格层
│  ├─ project.md
│  ├─ conventions.md
│  ├─ templates/          # 7 个模板
│  ├─ changes/            # 活跃 Feature
│  └─ archive/            # 已归档 Feature
│
├─ docs/                  # 文档层
│  ├─ architecture/       # 架构文档
│  ├─ domain/             # 领域知识
│  ├─ workflows/          # 工作流定义
│  ├─ knowledge/          # 知识沉淀
│  └─ standards/          # 工程规范
│
└─ .superpowers/          # Superpowers 执行层
   ├─ context/            # 执行规则
   ├─ checklists/         # 检查清单
   └─ skills/             # 7 个 Skill 命令
```

---

## 8. 相关文档

- [AGENTS.md](../../AGENTS.md) - AI 项目入口
- [PROJECT_RULES.md](../../PROJECT_RULES.md) - 项目硬规则
- [Feature Lifecycle](../workflows/feature-lifecycle.md) - Feature 生命周期
- [Glossary](../domain/glossary.md) - 术语表