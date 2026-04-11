# Feature Spec

## 元信息

- **Feature ID**: 006-ai-context-injection
- **创建日期**: 2026-04-11
- **状态**: specified
- **领域**: context

---

## 1. Overview

优化 AGENTS.md 的 AI 入口体验，创建 Claude Code 和 Gemini CLI 专用入口文件，添加快速导航，提升 AI 对框架的理解效率。

---

## 2. Requirements

### 2.1 Functional Requirements

#### FR-1: Claude Code 入口文件

创建 `CLAUDE.md`，包含：
- 框架核心规则摘要
- 必读文件优先级列表
- Feature 生命周期简图
- 状态文件关系要点

**验证标准**: Claude Code 能从 CLAUDE.md 正确执行 feature 流程

#### FR-2: Gemini CLI 入口文件

创建 `GEMINI.md`，包含：
- 框架核心规则摘要
- 必读文件优先级列表
- Gemini 特定加载指令
- 状态文件关系要点

**验证标准**: Gemini CLI 能从 GEMINI.md 正确执行 feature 流程

#### FR-3: AGENTS.md 快速导航

在 AGENTS.md 顶部添加：
- 快速导航表格（跳转到关键章节）
- TL;DR 摘要（一句话描述框架）
- 必读文件清单（3 个核心文件）

**验证标准**: AI 能快速定位关键信息

#### FR-4: 平台适配指南

创建 `docs/guides/ai-platform-adaptation.md`，包含：
- Claude Code 加载方式
- Gemini CLI 加载方式
- Copilot CLI 加载方式
- 其他平台通用建议

**验证标准**: 用户能按指南正确加载框架

### 2.2 Non-Functional Requirements

#### NFR-1: 简洁性

入口文件不超过 100 行，避免信息过载。

**验证标准**: 每个入口文件行数 ≤ 100

#### NFR-2: 一致性

各入口文件的核心规则描述一致。

**验证标准**: CLAUDE.md 和 GEMINI.md 规则描述相同

---

## 3. Boundary Conditions

1. **AGENTS.md 保持通用性** - 不针对特定平台
2. **入口文件不替代 AGENTS.md** - 只是快捷入口
3. **已归档 feature 不修改** - 保持历史一致性

---

## 4. Acceptance Scenarios

### AS-1: CLAUDE.md 创建

**Given** 框架需要 Claude Code 专用入口
**When** 创建 CLAUDE.md
**Then** 文件包含核心规则、必读文件、生命周期简图

### AS-2: GEMINI.md 创建

**Given** 框架需要 Gemini CLI 专用入口
**When** 创建 GEMINI.md
**Then** 文件包含核心规则、必读文件、加载指令

### AS-3: AGENTS.md 快速导航

**Given** AGENTS.md 信息较多
**When** 添加快速导航
**Then** 顶部包含导航表格和 TL;DR 摘要

### AS-4: 平台适配指南

**Given** 用户使用不同 AI 平台
**When** 创建适配指南
**Then** 文件包含至少 3 个平台的加载方式

---

## 5. Edge Cases

1. **平台无专用入口文件** - 使用 AGENTS.md 作为通用入口
2. **入口文件过期** - 添加版本日期和更新说明

---

## 6. Constraints

- 入口文件不复制 AGENTS.md 全部内容
- 使用引用而非重复
- 保持向后兼容

---

## 7. Out of Scope

- ❌ 不做: 修改模板文件
- ❌ 不做: 创建新的 skill 命令
- ❌ 不做: 修改已归档 feature
- ❌ 不做: 自动化 AI 加载检测

---

## 审批

- [x] Spec 已评审
- [x] Requirements 边界条件明确
- [x] Out of Scope 已列出
- [ ] 可进入 tasks 阶段