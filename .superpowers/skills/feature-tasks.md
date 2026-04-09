---
name: feature-tasks
description: "基于 proposal/spec 生成任务清单"
---

# /feature-tasks

基于 proposal/spec 生成任务清单。

## 功能

读取 proposal.md 和所有 spec.md，生成按依赖排序的任务列表。

## 输入

- `feature-id`: 已存在的 feature 目录

## 输出

- 更新后的 `tasks.md`

## 执行步骤

1. **读取所有规格文件**
   - proposal.md
   - specs/*/spec.md

2. **分析需求生成任务**
   - 每个需求映射到一个或多个任务
   - 任务粒度: 2-5 分钟可完成

3. **识别任务依赖关系**
   - 哪些任务必须先完成
   - 哪些任务可以并行

4. **生成任务列表**
   - 按依赖顺序排列
   - 每个任务包含: 目标、输入、输出、验证、依赖、状态

5. **更新 runstate**
   - 当前阶段: `planned`
   - 下一步动作: 执行 `/feature-implement`

## 任务格式

```markdown
### Task N: 任务标题

- **目标**: 这个任务要达成什么
- **输入**: 需要什么输入
- **输出**: 产出什么
- **验证**: 如何验证完成
- **依赖**: 依赖哪些任务
- **状态**: pending
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 更新 tasks.md
- 任务列表:
  Task 1: 创建日志配置文件
  Task 2: 实现日志写入器
  Task 3: 添加日志格式化
  Task 4: 编写测试
- 更新 runstate 为 planned
```