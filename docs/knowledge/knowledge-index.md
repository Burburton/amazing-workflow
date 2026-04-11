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
| 005-template-refinement | 模板改进 | archived | 2026-04-11 | 改进 tasks/runstate 模板，创建 spec 模板，添加状态同步规则和填写指南 |
| 006-ai-context-injection | AI 入口优化 | archived | 2026-04-11 | 创建 CLAUDE.md、GEMINI.md，优化 AGENTS.md，创建平台适配指南 |

---

## 可复用模式

> 详细内容见 [reusable-patterns.md](./reusable-patterns.md)

### 模式 1: Feature 生命周期管理

**来源**: 001-governance-foundation

**模式描述**:
使用 runstate.md 作为 AI 会话续接的关键文件，记录当前阶段、已完成项、阻塞点和下一步动作。

**适用场景**:
- 所有 feature 的状态追踪
- AI 会话中断后恢复

---

### 模式 2: 规格先行

**来源**: 001-governance-foundation

**模式描述**:
所有功能变更必须先定义 proposal/spec/tasks，不得跳过规格直接编码。

**适用场景**:
- 所有新功能开发
- Bug 修复（需要 mini-proposal）

---

### 模式 3: Dogfooding 验证模式

**来源**: 002-workflow-dogfooding

**模式描述**:
用一个真实 feature 验证治理框架的完整闭环。核心原则：验证为主、修复为次；发现缺口先记录；产出问题清单供后续使用。

**适用场景**:
- 验证新建立的治理框架
- 验证工作流定义的可用性
- 验证命令/skill 的实际执行效果

---

### 模式 4: 文档拆分模式

---

### 模式 5: 模板内嵌规则模式

**来源**: 005-template-refinement

**模式描述**:
将关键填写规则（如状态同步）直接嵌入模板文件顶部，而非分散在单独的规范文档中。好处：AI/用户读取模板时自动获取规则，减少查找成本。

**适用场景**:
- 模板有复杂填写规则
- 规则需要与模板结构同步更新
- 新用户/AI 需要快速上手

---

### 模式 6: 向后兼容验证模式

**来源**: 005-template-refinement

**模式描述**:
修改模板或规范时，必须验证现有格式仍然有效。核心原则：新增而非删除字段；不强制变更现有格式；用已归档 feature 进行兼容性测试。

**适用场景**:
- 修改核心模板或规范
- 项目有已完成的 feature
- 需确保不破坏现有工作流

---

## 常见问题

> 详细内容见 [common-failures.md](./common-failures.md)

### 问题 1: AI 会话中断后如何恢复？

**解决方案**:
1. 读取 `AGENTS.md` 了解项目结构
2. 读取当前 feature 的 `runstate.md`
3. 根据"下一步动作"继续执行

---

### 问题 2: Spec 与实现不一致怎么办？

**解决方案**:
1. 停止实现
2. 更新 spec 并说明原因
3. 获得用户确认
4. 继续实现

---

### 问题 3: skill 工具无法调用自定义 skill

**来源**: 002-workflow-dogfooding

**问题描述**:
OpenCode skill 工具只支持内置 skill，无法调用项目自定义的 feature-start, feature-spec 等命令。

**解决方案**:
- 临时方案：手动读取 SKILL.md 文件并按步骤执行
- 长期方案：在项目层面解决或等待 OpenCode 支持

---

### 问题 4: 知识文件缺失

**来源**: 002-workflow-dogfooding

**问题描述**:
docs/knowledge/ 目录下 reusable-patterns.md, common-failures.md, decision-history.md 文件不存在。

**解决方案**:
在下一个 feature 中创建这些文件。

---

## 决策历史

> 详细内容见 [decision-history.md](./decision-history.md)

| 日期 | 决策 | 原因 |
|------|------|------|
| 2026-04-09 | 采用精简版目录结构 | 第一阶段最小可用原则 |
| 2026-04-10 | Dogfooding 验证为主、修复为次 | 避免 feature 范围失控，产出问题清单 |
| 2026-04-10 | 不创建缺失知识文件 | 遵循验证原则，留给下一 feature |
| 2026-04-10 | 渐进式修复问题 | 分阶段降低风险 |
| 2026-04-11 | 状态同步规则嵌入模板 | AI 读取模板时自动获取规则，减少查找成本 |

---

## 更新记录

| 日期 | Feature | 更新内容 |
|------|---------|----------|
| 2026-04-09 | 001-governance-foundation | 初始化知识索引 |
| 2026-04-10 | 002-workflow-dogfooding | 添加 2 个可复用模式、2 个常见问题、2 条决策记录 |
| 2026-04-10 | 003-feature-hardening | 创建知识分类文件，添加状态文件关系规范 |
| 2026-04-11 | 005-template-refinement | 添加 2 个可复用模式、1 条决策记录 |
| 2026-04-11 | md-meta-extractor 验证 | 添加框架应用报告、2 个新模式、1 条决策记录 |
| 2026-04-11 | 框架改进 | 添加决策固化流程、新项目模板、2 条决策记录 |
| 2026-04-11 | 006-ai-context-injection | 添加 AI 平台入口文件、2 个新模式、2 条决策记录 |