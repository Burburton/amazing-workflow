# GEMINI.md - Gemini CLI 入口

> **TL;DR**: OpenSpec + Superpowers 治理框架。规格先行，状态可续，知识沉淀。

---

## 快速导航

| 章节 | 跳转 |
|------|------|
| 核心规则 | 见下方 |
| Feature 生命周期 | AGENTS.md Section 3 |
| 必读文件 | 见下方 |
| 模板位置 | openspec/templates/ |

---

## 1. 核心规则

| 规则 | 说明 |
|------|------|
| **规格先行** | 禁止跳过 proposal/spec/tasks 直接编码 |
| **状态维护** | 每个阶段必须更新 runstate.md |
| **知识沉淀** | feature 完成后同步到 knowledge-index.md |

---

## 2. Feature 生命周期

```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

| 阶段 | 产出文件 |
|------|----------|
| proposed | proposal.md, runstate.md |
| specified | specs/*/spec.md |
| planned | tasks.md |
| implementing | 实现代码 |
| verifying | test-summary.md |
| completed | implementation-summary, lessons-learned |

---

## 3. 必读文件（按优先级）

1. ✅ **GEMINI.md**（当前）
2. ✅ **PROJECT_RULES.md** - 硬规则
3. ✅ **openspec/project.md** - 项目目标
4. 当前 feature 的 **runstate.md**

---

## 4. 状态文件关系

| 文件 | 职责 | 更新时机 |
|------|------|----------|
| tasks.md | 任务级状态 | 任务完成时 |
| runstate.md | Feature 整体阶段 | 阶段变更时 |

**同步规则**: tasks 状态变更 → runstate 进度字段同步更新

---

## 5. 决策固化流程

在 spec 填写时，如果发现模糊点：
1. 分析可选方案（至少 2-3 种）
2. 从可用性/可扩展性评估
3. 选择最优方案并记录理由
4. 固化到 spec 文件
5. 记录到 decision-history.md

---

## 6. 当前项目状态

| Feature | 状态 |
|---------|------|
| 001-governance-foundation | archived |
| 002-workflow-dogfooding | archived |
| 003-feature-hardening | archived |
| 004-skill-execution | archived |
| 005-template-refinement | archived |
| 006-ai-context-injection | implementing |

---

## 7. Gemini CLI 特定指令

- Gemini CLI 会自动加载 GEMINI.md
- 使用 `activate_skill` 工具加载技能
- 每完成一个任务立即更新状态文件
- 完成后更新知识索引

---

## 参考

- [AGENTS.md](./AGENTS.md) - 完整项目入口
- [PROJECT_RULES.md](./PROJECT_RULES.md) - 硬规则
- [feature-lifecycle.md](./docs/workflows/feature-lifecycle.md) - 生命周期详情