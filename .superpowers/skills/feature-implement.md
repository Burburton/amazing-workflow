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