# Feature Proposal

## 元信息

- **Feature ID**: 007-auto-archive
- **创建日期**: 2026-04-11
- **状态**: proposed
- **作者**: AI (Sisyphus)

---

## 1. 背景

当前 feature 归档流程需要手动执行多个步骤：
1. 移动目录 `openspec/changes/<feature-id>` → `openspec/archive/<feature-id>`
2. 更新 `runstate.md` 状态为 `archived`
3. 更新 `docs/knowledge/knowledge-index.md` 添加 feature 记录
4. Git commit 并 push

每次归档都需要重复这些操作，且容易遗漏某一步骤（如忘记更新 knowledge-index.md）。

---

## 2. 问题陈述

归档流程手动执行效率低，且存在遗漏风险，需要自动化脚本简化流程。

---

## 3. 目标

- 目标 1: 创建自动化归档脚本，一键执行所有归档步骤
- 目标 2: 脚本支持验证 feature 状态（必须已完成验证）
- 目标 3: 脚本自动更新 runstate.md 和 knowledge-index.md
- 目标 4: 脚本自动执行 git commit

---

## 4. 非目标

- 不做 CI/CD 自动归档（暂时保持本地脚本）
- 不做 feature 全生命周期自动化（仅关注归档阶段）

---

## 5. 成功标准

- [ ] 标准 1: 执行 `npm run feature:archive <feature-id>` 完成所有归档步骤
- [ ] 标准 2: runstate.md 自动更新为 archived 状态
- [ ] 标准 3: knowledge-index.md 自动添加 feature 记录
- [ ] 标准 4: Git commit 自动执行
- [ ] 标准 5: 使用 007-auto-archive 自身验证脚本有效性

---

## 6. 影响范围

- `.superpowers/scripts/feature-archive.sh`: 新建或改进归档脚本
- `package.json`: 添加 npm script
- `docs/knowledge/knowledge-index.md`: 脚本自动更新此文件
- `openspec/archive/<feature-id>/runstate.md`: 脚本自动更新状态

---

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 脚本执行失败导致状态不一致 | 高 | 脚本添加回滚机制，失败时恢复原状态 |
| Git 操作失败 | 中 | 脚本先检查 git 状态，确保干净再执行 |

---

## 审批

- [ ] Proposal 已评审
- [ ] 可进入 spec 阶段