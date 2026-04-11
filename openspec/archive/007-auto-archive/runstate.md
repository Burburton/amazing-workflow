# Feature Runstate

> **使用说明**: 本模板记录 feature 的动态状态，支持 AI 会话续接。填写时确保"当前阶段"与 feature-lifecycle 对应，"下一步动作"明确具体。状态字段与 tasks.md 保持同步，详见下方"状态同步规则"。

## 元信息

- **Feature ID**: 007-auto-archive
- **更新日期**: 2026-04-11
- **更新者**: AI (Sisyphus)
- **当前阶段**: archived

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
- **runstate.md**: feature 状态的权威来源（整体阶段和续接入口）
- **runstate.md 的进度统计**: 从 tasks.md 计算得出，保持一致

---

## 当前状态

| 字段 | 值 |
|------|-----|
| archived ||| archived ||| archived ||| archived |
| 已完成 | Task 1-5 (脚本增强完成) |
| 进行中 | - |
| - ||| - ||| - ||| - |
| 阻塞点 | - |
| - ||| - ||| - ||| - |

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

- `openspec/changes/007-auto-archive/proposal.md`
- `openspec/changes/007-auto-archive/specs/archive/spec.md`
- `openspec/changes/007-auto-archive/tasks.md`
- `openspec/changes/007-auto-archive/runstate.md`

---

## 变更历史

| 日期 | 阶段变更 | 备注 |
|------|----------|------|
| 2026-04-11 | idea → proposed | feature 初始化 |
| 2026-04-11 | proposed → specified | specs/archive/spec.md 完成 |
| 2026-04-11 | specified → planned | tasks.md 拆解完成 |
| 2026-04-11 | planned → implementing | 开始执行 Task 2 |
| 2026-04-11 | implementing → completed | Task 1-5 完成，脚本增强完成 |

---

| 2026-04-11 | completed → archived | 移动到 openspec/archive/007-auto-archive/ |
## 最后验证时间

<!-- 记录上次验证的时间戳 -->

- 暂无验证记录

---

## 审批

- [ ] Runstate 已更新
- [ ] 状态与 tasks.md 一致
- [ ] 下一步动作明确
