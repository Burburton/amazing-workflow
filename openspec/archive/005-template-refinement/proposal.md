# Feature Proposal

## 元信息

- **Feature ID**: 005-template-refinement
- **创建日期**: 2026-04-11
- **状态**: proposed
- **作者**: AI (Sisyphus)

---

## 1. 背景

项目已完成 4 个 feature 的 dogfooding 验证，模板在实际使用中暴露了以下问题：
- tasks.md 和 runstate.md 状态字段不同步，导致进度追踪混乱
- spec.template.md 缺失，spec 阶段无标准模板
- 模板使用方式不够清晰，新用户/AI 需要摸索

---

## 2. 问题陈述

模板存在同步缺口和指引缺失，影响 AI 执行稳定性和新用户上手效率。

---

## 3. 目标

- 明确 tasks.md 与 runstate.md 的状态同步规则
- 优化 tasks.template.md 和 runstate.template.md 字段
- 新增 spec.template.md
- 添加使用指南和示例

---

## 4. 非目标

- 不改动 proposal.template.md、design.template.md 等其他模板
- 不改动 feature-lifecycle.md 工作流定义
- 不改动已归档 feature 的文件

---

## 5. 成功标准

- [ ] tasks.template.md 包含状态同步规则说明
- [ ] runstate.template.md 包含状态同步规则说明
- [ ] spec.template.md 已创建并符合 PROJECT_RULES.md 要求
- [ ] 模板内包含使用示例或填写指南
- [ ] 改进后的模板通过 AI 模拟验证

---

## 6. 影响范围

- `openspec/templates/tasks.template.md`
- `openspec/templates/runstate.template.md`
- `openspec/templates/spec.template.md`（新增）
- `docs/knowledge/reusable-patterns.md`（可能添加模板使用模式）

---

## 7. 风险与缓解

| 雎险 | 影响 | 缓解措施 |
|------|------|----------|
| 模板改动影响后续 feature | 中 | 保持向后兼容，新增字段而非删除 |
| AI 对新规则理解不一致 | 低 | 在模板内添加明确说明 |

---

## 审批

- [ ] Proposal 已评审
- [ ] 可进入 spec 阶段