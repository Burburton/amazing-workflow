# AI Platform Adaptation Guide

本指南说明不同 AI 平台如何加载和使用 amazing-workflow 治理框架。

---

## 1. Claude Code

### 加载方式

Claude Code 会自动加载项目根目录的 `CLAUDE.md` 文件。

### 入口文件

- **CLAUDE.md** - Claude Code 专用入口（推荐）
- **AGENTS.md** - 通用入口（备用）

### 特定指令

```markdown
- 使用 `skill` 工具加载技能
- 使用 `todowrite` 跟踪任务进度
- 每完成一个任务立即更新状态文件
```

### 推荐工作流

1. Claude Code 启动时自动读取 CLAUDE.md
2. 根据"当前项目状态"了解 feature 进度
3. 读取目标 feature 的 runstate.md
4. 按照"下一步动作"继续执行

---

## 2. Gemini CLI

### 加载方式

Gemini CLI 会自动加载项目根目录的 `GEMINI.md` 文件。

### 入口文件

- **GEMINI.md** - Gemini CLI 专用入口（推荐）
- **AGENTS.md** - 通用入口（备用）

### 特定指令

```markdown
- 使用 `activate_skill` 工具加载技能
- 工具名映射：todowrite → TodoWrite
```

### 推荐工作流

1. Gemini CLI 启动时自动读取 GEMINI.md
2. 根据"当前项目状态"了解 feature 进度
3. 读取目标 feature 的 runstate.md
4. 按照"下一步动作"继续执行

---

## 3. GitHub Copilot CLI

### 加载方式

Copilot CLI 读取 `.github/copilot-instructions.md` 文件。

### 入口文件

- **AGENTS.md** - 主要入口
- **.github/copilot-instructions.md** - Copilot 特定指令（可选）

### 创建 Copilot 入口

```bash
mkdir -p .github
```

创建 `.github/copilot-instructions.md`：

```markdown
# Copilot CLI 指令

本项目使用 OpenSpec + Superpowers 治理框架。

## 核心规则

1. 规格先行：禁止跳过 proposal/spec/tasks 直接编码
2. 状态维护：每个阶段必须更新 runstate.md
3. 知识沉淀：feature 完成后同步到 knowledge-index.md

## 必读文件

1. AGENTS.md
2. PROJECT_RULES.md
3. 当前 feature 的 runstate.md
```

---

## 4. 其他平台

### 通用建议

1. **使用 AGENTS.md 作为入口** - 包含完整框架规则
2. **优先读取 runstate.md** - 了解当前状态
3. **遵循核心规则** - 规格先行、状态维护、知识沉淀

### 自定义入口文件

如需创建其他平台入口（如 CODEX.md、CURSOR.md），参考 CLAUDE.md 结构：

```markdown
# <PLATFORM>.md - <平台名> 入口

> TL;DR: OpenSpec + Superpowers 治理框架

## 核心规则
## Feature 生命周期
## 必读文件
## 状态文件关系
## 当前项目状态
```

---

## 5. 入口文件对比

| 文件 | 目标平台 | 行数 | 内容侧重 |
|------|----------|------|----------|
| AGENTS.md | 通用 | ~200 | 完整框架规则 |
| CLAUDE.md | Claude Code | ~80 | 核心规则 + Claude 特定 |
| GEMINI.md | Gemini CLI | ~80 | 核心规则 + Gemini 特定 |

---

## 6. 维护指南

### 更新入口文件

当框架规则变化时，需同步更新：
1. AGENTS.md（主入口）
2. CLAUDE.md
3. GEMINI.md

### 版本标注

在入口文件顶部添加版本日期：

```markdown
> 最后更新: YYYY-MM-DD
```

---

## 7. 参考

- [CLAUDE.md](../CLAUDE.md)
- [GEMINI.md](../GEMINI.md)
- [AGENTS.md](../AGENTS.md)
- [feature-lifecycle.md](../workflows/feature-lifecycle.md)