# Feature Proposal

## 元信息

- **Feature ID**: 001-governance-foundation
- **创建日期**: 2026-04-09
- **状态**: completed
- **作者**: AI + User

---

## 1. 背景

在没有治理骨架的情况下，AI 驱动开发通常会出现需求定义分散、任务状态无法追踪、知识无法沉淀等问题。需要建立一套可被 OpenCode 直接执行的项目治理框架。

## 2. 问题陈述

当前缺少一套可被 AI 直接执行的项目治理骨架，导致 OpenSpec 与 Superpowers 无法在统一框架下稳定协作，feature 生命周期没有标准化落点。

## 3. 目标

- 建立标准目录骨架
- 建立项目级治理文件
- 建立 OpenSpec 基础模板
- 建立最小命令工作流定义
- 建立 runstate 机制
- 建立 knowledge index 机制

## 4. 非目标

- 不实现复杂的多 Agent 调度系统
- 不实现自动化代码生成引擎
- 不实现完整的知识图谱或向量检索系统

## 5. 成功标准

- [x] 标准目录已创建
- [x] 治理文件已创建
- [x] 模板文件已创建
- [x] Skill 命令已定义
- [x] 知识索引已创建

## 6. 影响范围

- 项目根目录: AGENTS.md, PROJECT_RULES.md, README.md
- openspec/: 完整目录结构
- .superpowers/: 执行规则和 skill 定义
- docs/: 工作流和知识层

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 文件过多难以维护 | 中 | 精简核心化，后续迭代补充 |
| 目录命名不稳定 | 中 | 在 conventions.md 中固定命名规则 |

---

## 审批

- [x] Proposal 已评审
- [x] 已完成实现