# Feature Tasks

## 元信息

- **Feature ID**: 006-ai-context-injection
- **更新日期**: 2026-04-11
- **状态**: planned

---

## 状态同步规则

> ⚠️ **重要**: tasks.md 的任务状态必须与 runstate.md 的整体状态保持同步。

---

## 任务列表

### Task 1: 创建 CLAUDE.md

- **目标**: 创建 Claude Code 专用入口文件
- **输入**: AGENTS.md 核心内容、Claude Code 加载特性
- **输出**: CLAUDE.md 文件
- **验证**: 文件 ≤ 100 行，包含核心规则
- **依赖**: 无
- **状态**: completed

### Task 2: 创建 GEMINI.md

- **目标**: 创建 Gemini CLI 专用入口文件
- **输入**: AGENTS.md 核心内容、Gemini CLI 加载特性
- **输出**: GEMINI.md 文件
- **验证**: 文件 ≤ 100 行，包含核心规则和加载指令
- **依赖**: 无
- **状态**: completed

### Task 3: 优化 AGENTS.md 快速导航

- **目标**: 添加顶部快速导航和 TL;DR
- **输入**: AGENTS.md 当前结构
- **输出**: 更新后的 AGENTS.md
- **验证**: 顶部包含导航表格和摘要
- **依赖**: 无
- **状态**: completed

### Task 4: 创建平台适配指南

- **目标**: 创建 AI 平台适配指南文档
- **输入**: Claude/Gemini/Copilot 加载方式
- **输出**: docs/guides/ai-platform-adaptation.md
- **验证**: 包含至少 3 个平台的加载方式
- **依赖**: 无
- **状态**: completed

### Task 5: 更新知识索引

- **目标**: 将新模式沉淀到知识层
- **输入**: lessons-learned
- **输出**: knowledge-index.md 更新
- **验证**: 包含新模式和决策
- **依赖**: Task 1-4
- **状态**: completed

---

## 任务依赖图

```
Task 1 ─┬─→ Task 5
Task 2 ─┤
Task 3 ─┤
Task 4 ─┘
```

---

## 进度统计

- 总任务数: 5
- 已完成: 5
- 进行中: 0
- 待处理: 0