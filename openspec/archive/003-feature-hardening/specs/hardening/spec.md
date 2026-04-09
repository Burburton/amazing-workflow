# Spec: feature-hardening

## Overview

本 spec 定义 003-feature-hardening 的具体需求和验收标准。核心目标是修复 002 dogfooding 发现的文档层面问题，完善知识层结构和状态追踪规范。

---

## Requirements

### Functional Requirements

#### FR-1 创建知识分类文件

系统必须创建以下知识分类文件：

- `docs/knowledge/reusable-patterns.md` - 可复用模式
- `docs/knowledge/common-failures.md` - 常见问题
- `docs/knowledge/decision-history.md` - 决策历史

每个文件必须包含从 knowledge-index.md 迁移的内容，以及扩展结构。

#### FR-2 明确状态文件关系

`openspec/conventions.md` 必须新增章节，明确说明：

- tasks.md 的职责：任务拆解和执行状态
- runstate.md 的职责：feature 整体阶段和续接信息
- 两者的同步规则

#### FR-3 扩展 runstate 模板

`openspec/templates/runstate.template.md` 必须包含：

- 扩展字段建议章节
- 示例扩展字段（如"观察记录"、"风险追踪"）

#### FR-4 更新知识索引

`docs/knowledge/knowledge-index.md` 必须更新：

- 添加指向新知识文件的链接
- 保留现有内容作为摘要

---

### Non-Functional Requirements

#### NFR-1 内容完整性

新创建的知识文件必须包含从 knowledge-index.md 迁移的现有内容。

#### NFR-2 结构一致性

知识文件的结构必须与 knowledge-index.md 的分类方式保持一致。

#### NFR-3 向后兼容

修改不应破坏现有 feature 的文件引用。

---

## Acceptance Scenarios

### AS-1 知识文件创建成功

**Given** docs/knowledge/ 目录存在  
**When** 执行 Task 1-3  
**Then** 三个知识文件均存在且非空  
**And** 每个文件包含至少 4 个条目

### AS-2 规范更新成功

**Given** openspec/conventions.md 存在  
**When** 执行 Task 4  
**Then** conventions.md 包含"状态文件关系"章节  
**And** tasks.md 和 runstate.md 的职责边界明确

### AS-3 模板更新成功

**Given** runstate.template.md 存在  
**When** 执行 Task 5  
**Then** 模板包含"扩展字段"章节  
**And** 提供示例扩展字段

### AS-4 知识索引更新成功

**Given** 三个新知识文件已创建  
**When** 执行 Task 6  
**Then** knowledge-index.md 包含指向新文件的链接  
**And** 现有内容保留作为摘要

---

## Edge Cases

1. **知识条目重复**: 从 knowledge-index.md 迁移时避免重复
2. **文件引用断裂**: 确保新文件路径正确
3. **模板扩展过度**: 保持扩展建议简洁，不强制特定字段

---

## Constraints

- 不删除 knowledge-index.md 中的现有内容
- 不修改已归档 feature 的文件
- 保持与现有模板格式兼容

---

## Out of Scope

- 解决 skill 工具调用问题（004 feature）
- 重构 feature 目录结构
- 创建新的 skill 命令