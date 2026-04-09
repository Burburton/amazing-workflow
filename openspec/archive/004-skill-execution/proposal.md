# Feature Proposal

## 元信息

- **Feature ID**: 004-skill-execution
- **创建日期**: 2026-04-10
- **状态**: proposed
- **作者**: AI (Sisyphus)
- **来源**: 002-workflow-dogfooding 发现的问题 #3

---

## 1. 背景

Feature 002 dogfooding 发现 OpenCode 的 skill 工具无法调用项目自定义 skill（feature-start, feature-spec 等）。这导致 AI 必须手动读取 SKILL.md 文件并按步骤执行，效率较低。

本 feature 目标是通过"指南 + 脚本"的方式解决这个问题，使 skill 命令可被有效执行。

---

## 2. 问题陈述

**核心问题**: skill 工具只支持内置 skill，无法调用项目自定义的 feature 命令。

**影响**:
- AI 每次都要手动读取 SKILL.md
- 执行效率低，容易遗漏步骤
- 无法自动化执行 skill 流程

---

## 3. 目标

- **目标 1**: 创建 skill 执行指南文档 - 说明如何手动/脚本执行 skill
- **目标 2**: 创建辅助执行脚本 - 提供 shell 脚本快速执行常用 skill
- **目标 3**: 更新 AGENTS.md - 添加 skill 使用入口说明

---

## 4. 非目标

- 不修改 OpenCode 源码
- 不创建复杂的 CLI 工具
- 不引入新的依赖

---

## 5. 成功标准

- [ ] skill 执行指南文档存在且内容完整
- [ ] 至少 3 个 skill 有对应的执行脚本
- [ ] AGENTS.md 包含 skill 使用说明
- [ ] 新的 AI 会话可通过指南或脚本执行 skill

---

## 6. 影响范围

- **文档**: 新增 skill 执行指南
- **脚本**: 新增 .superpowers/scripts/ 目录
- **AGENTS.md**: 更新 skill 使用说明

---

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 脚本跨平台兼容性 | 中 | 使用 POSIX shell，测试 Windows/macOS |
| 脚本与 SKILL.md 不同步 | 中 | 脚本注释引用 SKILL.md |

---

## 审批

- [x] Proposal 已评审
- [ ] 可进入 spec 阶段