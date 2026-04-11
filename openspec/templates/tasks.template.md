# Feature Tasks

> **使用说明**: 本模板定义 feature 的任务拆解。填写时确保每个任务有明确的目标、输入、输出、验证方法。状态字段与 runstate.md 保持同步，详见下方"状态同步规则"。

## 元信息

- **Feature ID**: {feature-id}
- **更新日期**: {date}
- **状态**: planned

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

<!-- ⚠️ 此统计应在每次任务状态变更后手动更新，或从任务列表计算 -->

- 总任务数: {N}
- 已完成: 0
- 进行中: 0
- 待处理: {N}

---

## 填写示例

```
### Task 1: 创建 feature 目录

- **目标**: 创建 openspec/changes/005-auth/ 目录结构
- **输入**: feature-id = 005-auth
- **输出**: 目录存在，包含 specs/ 子目录
- **验证**: 运行 ls openspec/changes/005-auth/
- **依赖**: 无
- **状态**: pending

### Task 2: 编写 proposal

- **目标**: 填写 proposal.md 的背景、目标、成功标准
- **输入**: 用户需求描述
- **输出**: proposal.md 完整填写
- **验证**: 所有必需字段有内容
- **依赖**: Task 1
- **状态**: pending

---

## 任务依赖图

Task 1 → Task 2 → Task 3 → Task 4

---

## 进度统计

- 总任务数: 4
- 已完成: 0
- 进行中: 0
- 待处理: 4
```

---

## 审批

- [ ] Tasks 已评审
- [ ] 任务粒度合适（2-5 分钟）
- [ ] 依赖关系明确
- [ ] 可进入 implement 阶段