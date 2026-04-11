# Feature Tasks

> **使用说明**: 本模板定义 feature 的任务拆解。填写时确保每个任务有明确的目标、输入、输出、验证方法。状态字段与 runstate.md 保持同步，详见下方"状态同步规则"。

## 元信息

- **Feature ID**: 007-auto-archive
- **更新日期**: 2026-04-11
- **状态**: completed

---

## 状态同步规则

> ⚠️ **重要**: tasks.md 的任务状态必须与 runstate.md 的整体状态保持同步。

### 状态对应关系

| tasks 任务状态 | runstate 整体状态字段 |
|---------------|----------------------|
| `completed` | 添加到"已完成"列表 |
| `in_progress` | 添加到"进行中"字段 |
| `pending` | 统计在"待处理"数量 |
| `blocked` | 在 runstate"阻塞点"字段说明原因 |

### 更新时机

1. **开始任务时**: 将任务状态改为 `in_progress`，同步更新 runstate.md 的"进行中"字段
2. **完成任务时**: 将任务状态改为 `completed`，同步更新 runstate.md 的"已完成"字段
3. **遇到阻塞时**: 将任务状态改为 `blocked`，在 runstate.md 的"阻塞点"字段记录原因

### 单一状态源原则

- **tasks.md**: 任务级状态的权威来源（具体任务的状态）
- **runstate.md**: feature 级状态的权威来源（整体阶段和进度概览）
- **runstate.md 的进度统计**: 从 tasks.md 计算得出，不是独立维护

---

## 任务列表

### Task 1: 设计归档脚本流程

- **目标**: 定义脚本执行的步骤顺序和验证逻辑
- **输入**: proposal.md, 现有归档经验
- **输出**: specs/archive/spec.md
- **验证**: spec.md 包含完整流程设计
- **依赖**: 无
- **状态**: completed

### Task 2: 添加状态验证逻辑

- **目标**: 脚本启动时检查 runstate.md 当前阶段，只允许 completed/verifying 状态归档
- **输入**: `.superpowers/scripts/feature-archive.sh`, `openspec/changes/<feature-id>/runstate.md`
- **输出**: 脚本包含验证逻辑，状态不符时退出
- **验证**: 测试 implementing 状态 feature 被拒绝
- **依赖**: Task 1
- **状态**: completed

### Task 3: 添加 knowledge-index.md 更新逻辑

- **目标**: 脚本自动在 Feature 索引表格添加归档记录
- **输入**: `docs/knowledge/knowledge-index.md`, feature 元信息
- **输出**: knowledge-index.md 包含新 feature 行
- **验证**: 执行后 knowledge-index.md 有正确记录
- **依赖**: Task 2
- **状态**: completed

### Task 4: 添加 git commit 自动提交

- **目标**: 脚本在所有文件更新后自动执行 git add 和 commit
- **输入**: git 状态
- **输出**: git commit 执行成功
- **验证**: `git log -1` 显示归档 commit
- **依赖**: Task 3
- **状态**: completed

### Task 5: 添加错误处理和用户提示

- **目标**: 每个步骤失败时输出清晰错误，提供下一步建议
- **输入**: 各步骤执行结果
- **输出**: 错误信息和建议
- **验证**: 模拟失败场景检查提示质量
- **依赖**: Task 4
- **状态**: completed

### Task 6: 使用脚本归档 007 自身

- **目标**: 用新脚本归档 007-auto-archive，验证完整流程
- **输入**: 007-auto-archive（completed 状态）
- **输出**: openspec/archive/007-auto-archive/, 知识更新, git commit
- **验证**: 所有 AS 场景通过
- **依赖**: Task 5
- **状态**: pending

---

## 任务依赖图

```
Task 1 → Task 2 → Task 3 → Task 4 → Task 5 → Task 6
```

---

## 进度统计

- 总任务数: 6
- 已完成: 5
- 进行中: 0
- 待处理: 1

---

## 审批

- [ ] Tasks 已评审
- [ ] 任务粒度合适（2-5 分钟）
- [ ] 依赖关系明确
- [ ] 可进入 implement 阶段