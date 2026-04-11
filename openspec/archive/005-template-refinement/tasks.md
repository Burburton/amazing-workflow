# Feature Tasks

## 元信息

- **Feature ID**: 005-template-refinement
- **更新日期**: 2026-04-11
- **状态**: completed

---

## 任务列表

### Task 1: 设计状态同步规则

- **目标**: 定义 tasks.md 与 runstate.md 的状态字段如何同步
- **输入**: dogfooding 发现的问题、已归档 feature 的实际用法
- **输出**: 状态同步规则文档（将嵌入模板）
- **验证**: 规则能解释已归档 feature 的实际状态变化
- **依赖**: 无
- **状态**: completed

### Task 2: 优化 tasks.template.md

- **目标**: 添加状态同步规则说明、使用示例、字段说明
- **输入**: Task 1 的状态同步规则
- **输出**: 改进后的 tasks.template.md
- **验证**: 模板包含同步规则、示例清晰
- **依赖**: Task 1
- **状态**: completed

### Task 3: 优化 runstate.template.md

- **目标**: 添加状态同步规则说明、使用示例、优化扩展字段
- **输入**: Task 1 的状态同步规则
- **输出**: 改进后的 runstate.template.md
- **验证**: 模板包含同步规则、示例清晰、扩展字段有指南
- **依赖**: Task 1
- **状态**: completed

### Task 4: 创建 spec.template.md

- **目标**: 创建符合 PROJECT_RULES.md 要求的 spec 模板
- **输入**: PROJECT_RULES.md Section 1.3、已归档 feature 的 spec 文件
- **输出**: 新的 spec.template.md
- **验证**: 模板包含 Overview、Requirements、Acceptance Scenarios、Out of Scope
- **依赖**: 无
- **状态**: completed

### Task 5: AI 模拟验证

- **目标**: 用 AI 模拟执行改进后的模板，验证可用性
- **输入**: 改进后的 3 个模板
- **输出**: 验证报告
- **验证**: AI 能正确理解和使用新模板
- **依赖**: Task 2, Task 3, Task 4
- **状态**: completed

---

## 任务依赖图

```
Task 1 → Task 2 → Task 5
       → Task 3 → Task 5
Task 4 ─────────→ Task 5
```

---

## 进度统计

- 总任务数: 5
- 已完成: 5
- 进行中: 0
- 待处理: 0