# Feature Proposal

## 元信息

- **Feature ID**: 002-workflow-dogfooding
- **创建日期**: 2026-04-10
- **状态**: proposed
- **作者**: AI + User
- **来源文档**: docs/infra/002-workflow-dogfooding-feature-spec.md

---

## 1. 背景

当前仓库已经具备第一阶段治理骨架，包括：

- 项目级治理文件（AGENTS.md, PROJECT_RULES.md, README.md）
- OpenSpec 基础目录与模板（openspec/templates/, openspec/conventions.md）
- `.superpowers` 下的命令/skill 骨架（7 个 feature 命令）
- feature lifecycle 工作流文档（docs/workflows/feature-lifecycle.md）
- knowledge index 基础结构（docs/knowledge/knowledge-index.md）

但目前这些能力主要还是"已定义""已文档化"的状态。要确认这套框架是否真正可用，必须通过一个独立 feature 做完整闭环验证。

---

## 2. 问题陈述

当前项目缺少一次真实的 feature 级闭环验证，导致无法确认以下关键问题：

1. 命令链路是否真的能从 start 走到 archive
2. 模板和目录是否真的适合执行
3. `runstate.md` 是否足以支撑会话中断后的恢复
4. `feature-verify` 和 `feature-close` 是否具备实际价值
5. 知识层是否能从真实 feature 中提炼经验
6. 当前治理框架中最容易漂移的环节是什么

如果不先解决这些问题，继续往更高级的自动化、多 Agent 或 UI 能力推进，会把基础问题放大。

---

## 3. 目标

- **目标 1**: 完整走通一次 feature 生命周期 - 从 `/feature-start` 到 `/feature-archive` 的完整闭环
- **目标 2**: 验证治理目录与模板的实际可用性 - 确认 proposal、spec、tasks、runstate、summary、knowledge 等文件真正能支撑工作
- **目标 3**: 验证命令/skill 的职责边界 - 确认每个命令在真实执行中都有明确输入、输出和状态推进作用
- **目标 4**: 验证 runstate 续接机制 - 确认 `runstate.md` 可作为续接入口
- **目标 5**: 提炼流程问题并沉淀知识 - 将发现的问题、建议和可复用模式写入知识层
- **目标 6**: 为下一个 feature 提供明确改进清单 - 产出足够清晰的问题清单

---

## 4. 非目标

本 feature 不包括以下内容：

- 不开发新的复杂业务模块
- 不引入多 Agent 编排系统
- 不增加 UI 或控制台
- 不做 CI/CD 自动化集成
- 不实现高级知识图谱或向量检索
- 不大规模重构项目目录
- 不将所有发现的问题都在本 feature 中修完
- 不把所有命令真正实现为复杂 CLI

---

## 5. 成功标准

- [ ] 标准 1: `002-workflow-dogfooding` 目录和文档完整存在
- [ ] 标准 2: proposal、spec、tasks、runstate 已形成完整闭环
- [ ] 标准 3: implement / verify / close 阶段都有明确产物
- [ ] 标准 4: 至少一次真实 runstate 更新被记录
- [ ] 标准 5: 至少一份 verification summary 被输出
- [ ] 标准 6: 至少一份 lessons learned 被输出
- [ ] 标准 7: 知识层至少写入 1 个 reusable pattern 和 1 个 common failure
- [ ] 标准 8: 已明确 archive 结果或 ready-to-archive 结果
- [ ] 标准 9: 已形成下一阶段改进清单

---

## 6. 影响范围

- **治理框架**: 验证但不修改核心治理文件
- **知识层**: 更新 docs/knowledge/knowledge-index.md
- **Feature 目录**: 创建 openspec/changes/002-workflow-dogfooding/

---

## 7. 风险与缓解

| 风险 | 影响 | 缓解措施 |
|------|------|----------|
| 把 dogfooding 做成"只写文档" | 高 | 强制按阶段推进，产出真实验证结论 |
| 发现问题后立即大改框架 | 高 | 优先记录问题，再决定是否修复 |
| runstate 仍然流于形式 | 高 | 明确要求持续更新 runstate |
| 只得到泛泛建议 | 中 | 验证 summary 必须包含具体缺口和建议 |

---

## 审批

- [x] Proposal 已评审（用户确认 Q1-Q4 选项）
- [ ] 可进入 spec 阶段