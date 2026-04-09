# Feature Proposal

## 元信息

- **Feature ID**: 003-feature-hardening
- **创建日期**: 2026-04-10
- **状态**: proposed
- **作者**: AI (Sisyphus)
- **来源**: 002-workflow-dogfooding 发现的问题清单

---

## 1. 背景

Feature 002 dogfooding 完成了治理框架的完整闭环验证，发现了以下问题：

| 优先级 | 问题 | 影响 |
|--------|------|------|
| 高 | 知识文件缺失 | docs/knowledge/ 下 reusable-patterns.md, common-failures.md, decision-history.md 不存在 |
| 中 | tasks.md 与 runstate.md 状态同步规则不明确 | 两者都记录任务状态，关系不清晰 |
| 低 | runstate 模板缺少扩展字段建议 | 自定义字段无规范 |

本 feature 目标是修复这些问题，使治理框架更加完善。

---

## 2. 问题陈述

当前知识层结构不完整，导致经验沉淀无法有效分类存储。同时，任务状态追踪存在冗余和模糊，影响 AI 执行效率。

具体问题：
1. 知识只能存入单一的 knowledge-index.md，无法按类型分类
2. tasks.md 和 runstate.md 都记录任务进度，但职责边界不清
3. runstate 模板过于刚性，不鼓励合理扩展

---

## 3. 目标

- **目标 1**: 创建知识分类文件 - reusable-patterns.md, common-failures.md, decision-history.md
- **目标 2**: 明确 tasks.md 与 runstate.md 的职责边界和同步规则
- **目标 3**: 更新 runstate 模板，添加扩展字段建议
- **目标 4**: 更新 knowledge-index.md，指向新创建的知识文件

---

## 4. 非目标

- 不解决 skill 工具调用问题（留到 004 feature）
- 不重构现有 feature 目录结构
- 不修改已归档 feature 的文件

---

## 5. 成功标准

- [ ] docs/knowledge/reusable-patterns.md 存在且包含至少 4 个模式
- [ ] docs/knowledge/common-failures.md 存在且包含至少 4 个问题
- [ ] docs/knowledge/decision-history.md 存在且包含至少 4 条决策
- [ ] openspec/conventions.md 明确 tasks.md 与 runstate.md 关系
- [ ] openspec/templates/runstate.template.md 包含扩展字段建议
- [ ] knowledge-index.md 更新指向新文件

---

## 6. 影响范围

- **知识层**: 新增 3 个知识分类文件
- **模板**: 更新 runstate.template.md
- **规范**: 更新 openspec/conventions.md

---

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 知识分类粒度不合适 | 中 | 参考现有 knowledge-index.md 的分类 |
| 规则描述过于复杂 | 低 | 保持简洁，用示例说明 |

---

## 审批

- [x] Proposal 已评审
- [ ] 可进入 spec 阶段