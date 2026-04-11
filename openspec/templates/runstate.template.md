# Feature Runstate

> **使用说明**: 本模板记录 feature 的动态状态，支持 AI 会话续接。填写时确保"当前阶段"与 feature-lifecycle 对应，"下一步动作"明确具体。状态字段与 tasks.md 保持同步，详见下方"状态同步规则"。

## 元信息

- **Feature ID**: {feature-id}
- **更新日期**: {date}
- **更新者**: {agent-or-user}
- **当前阶段**: proposed

---

## 状态同步规则

> ⚠️ **重要**: runstate.md 的整体状态必须与 tasks.md 的任务状态保持同步。

### 状态对应关系

| runstate 整体状态字段 | 来源（tasks.md） |
|---------------------|-----------------|
| "已完成" | 所有状态为 `completed` 的任务编号 |
| "进行中" | 当前状态为 `in_progress` 的任务编号 |
| "待处理" | 所有状态为 `pending` 的任务编号 |
| "阻塞点" | 状态为 `blocked` 的任务及原因 |

### 更新时机

1. **任务状态变更时**: 同步更新 runstate.md 对应字段
2. **阶段变更时**: 更新"当前阶段"字段（proposed → specified → planned → implementing → verifying → completed）
3. **遇到阻塞时**: 在"阻塞点"字段记录详细原因

### 单一状态源原则

- **tasks.md**: 任务级状态的权威来源（具体任务的状态）
- **runstate.md**: feature 级状态的权威来源（整体阶段和续接入口）
- **runstate.md 的进度统计**: 从 tasks.md 计算得出，保持一致

---

## 当前状态

| 字段 | 值 |
|------|-----|
| 当前阶段 | proposed |
| 已完成 | - |
| 进行中 | - |
| 待处理 | proposal 待填写 |
| 阻塞点 | - |
| 下一步动作 | 填写 proposal.md |

---

## 阶段说明

| 阶段 | 说明 | 典型下一步动作 |
|------|------|---------------|
| proposed | feature 初始化完成 | 填写 proposal.md |
| specified | spec 已完成 | 拆解 tasks.md |
| planned | tasks 已完成 | 开始执行任务 |
| implementing | 执行中 | 完成当前任务 |
| verifying | 验证中 | 生成验证报告 |
| completed | 完成但未归档 | 准备归档材料 |
| archived | 已归档 | 无 |

---

## 重要文件

<!-- 记录本次 feature 关键文件路径 -->

- `openspec/changes/{feature-id}/proposal.md`
- `openspec/changes/{feature-id}/tasks.md`
- `openspec/changes/{feature-id}/runstate.md`

---

## 变更历史

| 日期 | 阶段变更 | 备注 |
|------|----------|------|
| {date} | idea → proposed | feature 初始化 |

---

## 最后验证时间

<!-- 记录上次验证的时间戳 -->

- 暂无验证记录

---

## 扩展字段

<!-- 可根据 feature 需要灵活添加以下扩展字段 -->

### 观察记录

<!-- 当 feature 涉及验证、调研时使用 -->

| 观察点 | 发现 | 分类 |
|--------|------|------|
| 示例 | 发现某模板字段不够用 | 模板改进 |

### 风险追踪

<!-- 当 feature 有较高风险时使用 -->

| 风险 | 影响 | 状态 | 缓解措施 |
|------|------|------|----------|
| 示例风险 | 中 | 监控中 | 制定备选方案 |

### 决策记录

<!-- 当 feature 内有重要技术决策时使用 -->

| 决策 | 理由 | 替代方案 |
|------|------|----------|
| 示例决策 | 原因说明 | 方案B |

---

## 扩展字段使用指南

### 何时添加扩展字段

| 扩展字段 | 添加时机 | 典型内容 |
|----------|----------|----------|
| 观察记录 | feature 涉及验证、调研时 | 发现的问题、有效做法 |
| 风险追踪 | feature 有较高风险时 | 识别的风险及缓解措施 |
| 决策记录 | feature 内有重要决策时 | 技术选择及理由 |

### 添加新扩展字段

1. 在"扩展字段"章节下添加新子章节
2. 使用表格格式保持一致性
3. 在章节开头说明用途

### 注意事项

- 扩展字段应服务于 feature 目标
- 不要过度扩展，保持简洁
- 与 tasks.md 和 proposal.md 保持一致
- 归档前清理不必要的扩展字段

---

## 填写示例

```
## 当前状态

| 字段 | 值 |
|------|-----|
| 当前阶段 | implementing |
| 已完成 | Task 1-3 |
| 进行中 | Task 4 |
| 待处理 | Task 5-8 |
| 阻塞点 | 无 |
| 下一步动作 | 完成 Task 4: 编写 spec.md |

## 变更历史

| 日期 | 阶段变更 | 备注 |
|------|----------|------|
| 2026-04-11 | idea → proposed | feature 初始化 |
| 2026-04-11 | proposed → specified | proposal.md 评审通过 |
| 2026-04-11 | specified → planned | tasks.md 完成 |
| 2026-04-11 | planned → implementing | 开始执行 Task 1 |
```

---

## 审批

- [ ] Runstate 已更新
- [ ] 状态与 tasks.md 一致
- [ ] 下一步动作明确