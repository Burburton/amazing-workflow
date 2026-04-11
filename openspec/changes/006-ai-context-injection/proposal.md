# Feature Proposal

## 元信息

- **Feature ID**: 006-ai-context-injection
- **创建日期**: 2026-04-11
- **状态**: proposed
- **作者**: AI (Sisyphus)

---

## 1. 背景

amazing-workflow 框架已完成 Phase 1 验证，但 AGENTS.md 的 AI 入口体验有待优化：

- 不同 AI 平台（Claude Code、Gemini CLI、Copilot CLI）加载方式不同
- AGENTS.md 内容较长，AI 可能遗漏关键信息
- 缺少针对不同平台的优化指南

---

## 2. 问题陈述

AI 平台加载 AGENTS.md 时，可能因格式不适配或信息过多而无法正确理解框架规则。

---

## 3. 目标

- 创建 Claude Code 专用入口文件（CLAUDE.md）
- 创建 Gemini CLI 专用入口文件（GEMINI.md）
- 优化 AGENTS.md 结构，添加快速导航
- 创建平台适配指南文档

---

## 4. 非目标

- 不修改 feature-lifecycle 核心流程
- 不创建新的 skill 命令
- 不修改模板文件
- 不改动已归档 feature

---

## 5. 成功标准

- [ ] CLAUDE.md 能让 Claude Code 正确理解框架
- [ ] GEMINI.md 能让 Gemini CLI 正确理解框架
- [ ] AGENTS.md 添加快速导航章节
- [ ] 创建 docs/guides/ai-platform-adaptation.md

---

## 6. 影响范围

- `CLAUDE.md`（新增）
- `GEMINI.md`（新增）
- `AGENTS.md`（优化）
- `docs/guides/ai-platform-adaptation.md`（新增）

---

## 7. 风险与缓解

| 雎险 | 影响 | 缓解措施 |
|------|------|----------|
| 平台规则变化 | 低 | 添加版本说明和参考链接 |
| 内容重复 | 低 | 使用引用而非复制 |

---

## 审批

- [ ] Proposal 已评审
- [ ] 可进入 spec 阶段