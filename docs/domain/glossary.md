# Glossary

本文档定义 Amazing Workflow 项目的术语表。

---

## 核心概念

### Feature

**定义**: 功能变更单元，遵循完整的生命周期流程。

**生命周期阶段**:
```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

**相关文件**:
- `proposal.md` - 定义"为什么要做"
- `specs/*/spec.md` - 定义"系统应该表现成什么样"
- `tasks.md` - 定义"要分几步完成"
- `runstate.md` - 定义"现在做到哪了"
- `design.md` - 定义"准备怎么实现"（可选）

---

### OpenSpec

**定义**: 规格定义层，管理变更的定义与归档。

**职责**:
- 接收新需求
- 建立 Feature 目录
- 维护 proposal、spec、design、tasks
- 在完成后执行 archive
- 形成 Feature 级别的知识资产

**目录位置**: `openspec/`

**核心文件**:
| 文件 | 职责 |
|------|------|
| `project.md` | 项目级目标与范围 |
| `conventions.md` | OpenSpec 约定规则 |
| `templates/` | Feature 文档模板 |
| `changes/` | 活跃 Feature 目录 |
| `archive/` | 已归档 Feature 目录 |

---

### Superpowers

**定义**: 执行层，管理任务的执行与验证。

**职责**:
- brainstorming（需求探索）
- plan elaboration（计划展开）
- coding（编码实现）
- TDD / 测试补全
- debugging（调试）
- verification（验证）
- review orchestration（审查编排）
- 子任务并行推进

**目录位置**: `.superpowers/`

**核心 Skills**:
| Skill | 职责 |
|-------|------|
| `feature-start` | 创建 Feature 目录 |
| `feature-spec` | 创建规格文档 |
| `feature-tasks` | 生成任务列表 |
| `feature-implement` | 执行实现 |
| `feature-verify` | 验证测试 |
| `feature-close` | 收尾总结 |
| `feature-archive` | 归档 |

---

### Runstate

**定义**: 运行状态文件，支持 AI 会话续接。

**职责**:
- 记录当前阶段
- 记录已完成任务
- 记录阻塞点
- 记录下一步动作

**文件位置**: `openspec/changes/<feature-id>/runstate.md`

**核心字段**:
| 字段 | 说明 |
|------|------|
| 当前阶段 | proposed / specified / planned / implementing / verifying / completed / archived |
| 已完成 | 已完成的任务列表 |
| 进行中 | 正在进行的任务 |
| 待处理 | 待处理的任务 |
| 阻塞点 | 当前阻塞（如有） |
| 下一步动作 | 下一步要做什么 |

---

### Knowledge Index

**定义**: 项目知识索引，沉淀跨 Feature 的可复用知识。

**职责**:
- Feature 索引
- 可复用模式
- 常见问题
- 决策历史

**文件位置**: `docs/knowledge/knowledge-index.md`

---

## 文件类型

### Proposal

**定义**: Feature 提案文档，定义"为什么要做"。

**必需字段**:
- 背景
- 问题陈述
- 目标
- 非目标
- 成功标准

**文件位置**: `openspec/changes/<feature-id>/proposal.md`

---

### Spec

**定义**: 规格文档，定义"系统应该表现成什么样"。

**必需字段**:
- Overview（概述）
- Requirements（需求）
- Acceptance Scenarios（验收场景）
- Edge Cases（边界情况）
- Constraints（约束）
- Out of Scope（范围外）

**文件位置**: `openspec/changes/<feature-id>/specs/<domain>/spec.md`

---

### Design

**定义**: 设计文档，定义"准备怎么实现"。

**适用场景**:
- 需要架构调整
- 涉及多模块改动
- 有数据结构变化
- 有性能/并发/安全风险

**必需字段**:
- Context（上下文）
- Proposed Architecture（架构方案）
- Module Changes（模块变更）
- Data Flow（数据流）
- Trade-offs（权衡）
- Risks（风险）

**文件位置**: `openspec/changes/<feature-id>/design.md`

---

### Tasks

**定义**: 任务清单文档，定义"要分几步完成"。

**任务格式**:
```markdown
### Task N: 任务标题

- **目标**: 这个任务要达成什么
- **输入**: 需要什么输入
- **输出**: 产出什么
- **验证**: 如何验证完成
- **依赖**: 依赖哪些任务
- **状态**: pending / in_progress / completed
```

**文件位置**: `openspec/changes/<feature-id>/tasks.md`

---

### Implementation Summary

**定义**: 实现总结文档，记录"实际做了什么"。

**必需字段**:
- 实际完成项
- 偏离设计的地方
- 新增/修改文件清单
- 尚未完成项

**文件位置**: `openspec/changes/<feature-id>/implementation-summary.md`

---

### Test Summary

**定义**: 测试总结文档，记录"验证结果如何"。

**必需字段**:
- 测试范围
- 测试类型
- 通过结果
- 未覆盖项
- 已知风险

**文件位置**: `openspec/changes/<feature-id>/test-summary.md`

---

### Lessons Learned

**定义**: 经验教训文档，记录"这次 Feature 的经验"。

**必需字段**:
- 成功做法
- 失败点
- 可复用模式
- 对后续 Feature 的建议

**文件位置**: `openspec/changes/<feature-id>/lessons-learned.md`

---

## Skill 命令

### /feature-start

**触发词**: "创建新 feature"

**功能**: 创建 `openspec/changes/<feature-id>/` 目录结构

**输入**: feature-id, feature-title

**输出**: proposal.md, tasks.md, runstate.md, specs/

---

### /feature-spec

**触发词**: "细化 feature 规格"

**功能**: 校验 proposal，创建 specs 子目录

**输入**: feature-id

**输出**: specs/*/spec.md

---

### /feature-tasks

**触发词**: "拆解任务"

**功能**: 基于 proposal/spec 生成任务清单

**输入**: feature-id

**输出**: 更新后的 tasks.md

---

### /feature-implement

**触发词**: "开始实现"

**功能**: 加载固定输入包，按 tasks 执行

**输入**: feature-id

**输出**: 实现代码，更新 runstate.md

---

### /feature-verify

**触发词**: "验证完成"

**功能**: 执行测试，生成验证报告

**输入**: feature-id

**输出**: 测试结果，验证报告

---

### /feature-close

**触发词**: "收尾 feature"

**功能**: 生成总结，更新知识索引

**输入**: feature-id

**输出**: summary, lessons-learned, 更新 knowledge-index

---

### /feature-archive

**触发词**: "归档 feature"

**功能**: 移动到 archive 目录

**输入**: feature-id

**输出**: 移动目录，更新索引

---

## 阶段术语

### proposed

**定义**: Feature 已创建，proposal 待填写。

**必读文件**: proposal.md, runstate.md

---

### specified

**定义**: proposal 完成，spec 待填写。

**必读文件**: specs/*/spec.md

---

### planned

**定义**: spec 完成，tasks 待生成。

**必读文件**: tasks.md

---

### implementing

**定义**: 任务正在执行。

**必读文件**: 全部输入包

---

### verifying

**定义**: 实现完成，待验证。

**必读文件**: runstate.md, tasks.md

---

### completed

**定义**: 验证通过，待收尾。

**必读文件**: runstate.md

---

### archived

**定义**: Feature 已归档。

**必读文件**: knowledge-index.md

---

## 命名规范

### Feature ID

**格式**: `NNN-semantic-name`

**示例**:
- `001-governance-foundation`
- `002-user-auth`
- `003-session-management`

**规则**:
- 序号从 001 开始，连续递增
- 使用小写字母和连字符
- 语义名称 2-4 个单词

---

### 文件命名

| 文件类型 | 命名 |
|----------|------|
| 提案 | `proposal.md` |
| 规格 | `spec.md` |
| 设计 | `design.md` |
| 任务 | `tasks.md` |
| 状态 | `runstate.md` |
| 实现总结 | `implementation-summary.md` |
| 测试总结 | `test-summary.md` |
| 经验教训 | `lessons-learned.md` |
| 模板 | `*.template.md` |

---

## 相关文档

- [System Overview](../architecture/system-overview.md) - 系统架构
- [Feature Lifecycle](../workflows/feature-lifecycle.md) - Feature 生命周期
- [Conventions](../../openspec/conventions.md) - OpenSpec 约定