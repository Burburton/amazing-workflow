# Knowledge Index

项目知识沉淀索引。每个 feature 完成后更新此文件。

---

## 知识文件导航

| 文件 | 用途 | 内容 |
|------|------|------|
| [knowledge-index.md](./knowledge-index.md) | 知识索引 | 本文件，摘要和导航 |
| [reusable-patterns.md](./reusable-patterns.md) | 可复用模式 | 验证过的实践模式 |
| [common-failures.md](./common-failures.md) | 常见问题 | 典型问题及解决方案 |
| [decision-history.md](./decision-history.md) | 决策历史 | 重要决策及其理由 |
| [framework-application-report.md](./framework-application-report.md) | 框架应用报告 | md-meta-extractor 项目验证报告 |
| [ai-platform-adaptation.md](../guides/ai-platform-adaptation.md) | AI 平台适配指南 | 不同平台加载方式 |

---

## Feature 索引

| Feature ID | 名称 | 状态 | 完成日期 | 主要贡献 |
|------------|------|------|----------|----------|
| 001-governance-foundation | 治理骨架 | archived | 2026-04-09 | 建立项目治理框架 |
| 002-workflow-dogfooding | 工作流自验证 | archived | 2026-04-10 | 验证治理框架闭环可用性 |
| 003-feature-hardening | 治理加固 | archived | 2026-04-10 | 创建知识分类文件，明确状态文件关系 |
| 004-skill-execution | Skill 执行方案 | archived | 2026-04-10 | 创建执行指南和脚本，解决 skill 调用问题 |
| 005-template-refinement | 模板改进 | archived | 2026-04-11 | 改进 tasks/runstate 模板，创建 spec 模板 |
| 006-ai-context-injection | AI 入口优化 | archived | 2026-04-11 | 创建 CLAUDE.md、GEMINI.md，优化 AGENTS.md |
| 007-auto-archive | 自动归档脚本 | archived | 2026-04-11 | 增强归档脚本，自动更新状态和知识索引 |

---

## 可复用模式

> 详细内容见 [reusable-patterns.md](./reusable-patterns.md)

### 模式 1: Feature 生命周期管理

**来源**: 001-governance-foundation

**模式描述**:
使用 runstate.md 作为 AI 会话续接的关键文件，记录当前阶段、已完成项、阻塞点和下一步动作。

---

### 模式 2: 规格先行

**来源**: 001-governance-foundation

**模式描述**:
所有功能变更必须先定义 proposal/spec/tasks，不得跳过规格直接编码。

---

### 模式 3: Dogfooding 验证模式

**来源**: 002-workflow-dogfooding

**模式描述**:
用一个真实 feature 验证治理框架的完整闭环。

---

### 模式 4: 自举验证模式

**来源**: 007-auto-archive

**模式描述**:
用脚本自身来归档脚本 feature，验证脚本完整流程。

---

## 常见问题

> 详细内容见 [common-failures.md](./common-failures.md)

### 问题 1: AI 会话中断后如何恢复？

**解决方案**:
1. 读取 `AGENTS.md` 了解项目结构
2. 读取当前 feature 的 `runstate.md`
3. 根据"下一步动作"继续执行

---

### 问题 5: awk/sed 脚本跨平台兼容性问题

**来源**: 007-auto-archive

**问题描述**:
macOS 和 Linux 的 sed/awk 行为不同，导致脚本在不同平台执行结果不一致。

**解决方案**:
- 使用 awk 替代复杂的 sed 操作
- 避免在 awk 正则中使用 `|` 作为字符（它是"或"操作符）
- 测试时覆盖 macOS 和 Linux 环境

---

## 决策历史

> 详细内容见 [decision-history.md](./decision-history.md)

| 日期 | 决策 | 原因 |
|------|------|------|
| 2026-04-09 | 采用精简版目录结构 | 第一阶段最小可用原则 |
| 2026-04-11 | 归档脚本使用 awk 替代 sed | awk 跨平台兼容性更好 |
| 2026-04-11 | awk 正则避免使用 \| 字符 | awk 中 \| 是"或"操作符，需用其他方式匹配 |

---

## 更新记录

| 日期 | Feature | 更新内容 |
|------|---------|----------|
| 2026-04-09 | 001-governance-foundation | 初始化知识索引 |
| 2026-04-10 | 002-workflow-dogfooding | 添加可复用模式 |
| 2026-04-11 | 007-auto-archive | 添加归档脚本增强，修复 awk 逻辑 |

---