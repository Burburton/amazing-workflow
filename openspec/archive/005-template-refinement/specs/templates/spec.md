# Feature Spec

## 元信息

- **Feature ID**: 005-template-refinement
- **创建日期**: 2026-04-11
- **状态**: specified
- **领域**: templates

---

## 1. Overview

改进 tasks.template.md、runstate.template.md，新增 spec.template.md，解决 dogfooding 发现的模板同步和指引缺失问题。

---

## 2. Requirements

### R1: 状态同步规则

tasks.md 和 runstate.md 必须定义明确的状态同步规则：
- **R1.1**: tasks.md 中每个任务的"状态"字段与 runstate.md 的"已完成/进行中/待处理"字段存在对应关系
- **R1.2**: 状态变更时机明确（何时更新 tasks，何时更新 runstate）
- **R1.3**: 单一状态源原则（避免两处状态冲突）

### R2: 模板字段优化

- **R2.1**: tasks.template.md 添加"同步说明"章节
- **R2.2**: runstate.template.md 优化扩展字段指南，添加何时使用、如何添加
- **R2.3**: 两个模板都添加填写示例

### R3: spec.template.md 创建

根据 PROJECT_RULES.md Section 1.3，spec 必须包含：
- **R3.1**: Overview 章节
- **R3.2**: Requirements 章节（边界条件明确）
- **R3.3**: Acceptance Scenarios 章节
- **R3.4**: Out of Scope 章节

### R4: 使用指南

- **R4.1**: 每个改进模板包含简短使用说明（顶部）
- **R4.2**: 关键字段提供填写示例

---

## 3. Acceptance Scenarios

### AS1: 状态同步规则验证

**场景**: AI 读取改进后的模板，能正确理解状态同步规则

**输入**: tasks.template.md 和 runstate.template.md

**期望输出**:
- AI 能回答"何时更新 tasks 状态"
- AI 能回答"何时更新 runstate 状态"
- AI 能回答"两处状态的关系"

**验证方式**: 模拟问答测试

### AS2: tasks.template.md 结构验证

**场景**: 改进后的 tasks.template.md 包含必要章节

**输入**: tasks.template.md

**期望输出**: 包含以下章节
- 同步说明（或等效章节）
- 任务格式示例
- 进度统计说明

**验证方式**: 文件内容检查

### AS3: runstate.template.md 结构验证

**场景**: 改进后的 runstate.template.md 包含必要章节

**输入**: runstate.template.md

**期望输出**: 包含以下章节
- 状态同步说明
- 扩展字段使用指南（优化版）
- 填写示例

**验证方式**: 文件内容检查

### AS4: spec.template.md 结构验证

**场景**: 新创建的 spec.template.md 符合 PROJECT_RULES.md 要求

**输入**: spec.template.md

**期望输出**: 包含以下章节
- Overview
- Requirements（含边界条件说明）
- Acceptance Scenarios
- Out of Scope

**验证方式**: 文件内容检查

### AS5: AI 模拟执行验证

**场景**: AI 模拟使用新模板创建一个 mini feature

**输入**: 改进后的 3 个模板

**期望输出**:
- AI 能正确填写模板字段
- 状态同步规则被正确执行
- 无歧义或困惑点

**验证方式**: 模拟执行测试

### AS6: 向后兼容验证

**场景**: 改进后的模板不破坏已归档 feature 的格式

**输入**: 已归档的 001-004 feature 文件

**期望输出**: 现有格式仍然有效，无强制变更

**验证方式**: 对比检查

---

## 4. Out of Scope

- 不改动 proposal.template.md、design.template.md、implementation-summary.template.md、lessons-learned.template.md、test-summary.template.md
- 不改动 PROJECT_RULES.md
- 不改动 feature-lifecycle.md
- 不改动已归档 feature 的任何文件
- 不创建新的 skill 命令
- 不实现自动化状态同步脚本

---

## 审批

- [ ] Spec 已评审
- [ ] 可进入 tasks 阶段