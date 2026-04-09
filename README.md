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