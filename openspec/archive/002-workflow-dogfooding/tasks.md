# Feature Tasks

## 元信息

- **Feature ID**: 002-workflow-dogfooding
- **更新日期**: 2026-04-10
- **状态**: planned

---

## 任务列表

### Task 1: 启动 002 feature

- **目标**: 创建 `002-workflow-dogfooding` feature 目录及基础文件
- **输入**: docs/infra/002-workflow-dogfooding-feature-spec.md
- **输出**: feature 目录存在，proposal.md, tasks.md, runstate.md 初始化完成
- **验证**: 目录、命名和初始状态符合规范
- **依赖**: 无
- **状态**: completed

### Task 2: 编写 proposal

- **目标**: 明确本 feature 的背景、目标、范围和非目标
- **输入**: docs/infra/002-workflow-dogfooding-feature-spec.md Sections 1-7
- **输出**: `proposal.md` 完整
- **验证**: 能够支撑后续 spec 和 tasks
- **依赖**: Task 1
- **状态**: completed

### Task 3: 编写 spec

- **目标**: 把 dogfooding 目标转化为可验证的需求和场景
- **输入**: docs/infra/002-workflow-dogfooding-feature-spec.md Sections 10-15
- **输出**: `specs/dogfooding/spec.md` 完整
- **验证**: spec 中有 requirements 和 acceptance scenarios
- **依赖**: Task 2
- **状态**: completed

### Task 4: 编写 tasks

- **目标**: 形成可执行的任务拆解
- **输入**: docs/infra/002-workflow-dogfooding-feature-spec.md Section 17
- **输出**: `tasks.md` 完整
- **验证**: 任务具备依赖顺序和可验证性
- **依赖**: Task 3
- **状态**: completed

### Task 5: 执行闭环验证

- **目标**: 按命令阶段推进本 feature
- **输入**: proposal.md, spec.md, tasks.md
- **输出**: runstate、阶段性产物和执行记录
- **验证**: 至少走通 start/spec/tasks/implement/verify/close
- **依赖**: Task 4
- **状态**: completed

### Task 6: 验证 runstate 机制

- **目标**: 确认 runstate 真的能表达当前状态并支撑续接
- **输入**: runstate.md
- **输出**: runstate 中有多次更新痕迹与明确状态
- **验证**: 新的执行者可仅通过 runstate 理解当前情况
- **依赖**: Task 5
- **状态**: completed

### Task 7: 验证命令/skill 边界

- **目标**: 确认 skills 文档与实际流程是否一致
- **输入**: .superpowers/skills/*/SKILL.md, docs/workflows/feature-lifecycle.md
- **输出**: 问题清单或一致性结论
- **验证**: 至少识别一个有效点和一个缺口
- **依赖**: Task 5
- **状态**: completed

### Task 8: 验证文档一致性

- **目标**: 确认 README、PROJECT_RULES、AGENTS、workflow 文档之间是否一致
- **输入**: README.md, PROJECT_RULES.md, AGENTS.md, docs/workflows/feature-lifecycle.md
- **输出**: 一致性检查报告
- **验证**: 检查是否有冲突或不一致
- **依赖**: Task 5
- **状态**: completed

### Task 9: 生成 verification summary

- **目标**: 输出流程验证结果
- **输入**: 所有验证过程记录
- **输出**: `test-summary.md`
- **验证**: 包含通过项、缺口、风险与建议
- **依赖**: Task 6, Task 7, Task 8
- **状态**: completed

### Task 10: 生成 implementation summary 与 lessons learned

- **目标**: 总结本次实战的结果
- **输入**: 整个 dogfooding 过程
- **输出**: `implementation-summary.md`, `lessons-learned.md`
- **验证**: 内容能支撑知识沉淀和下一 feature 输入
- **依赖**: Task 9
- **状态**: completed

### Task 11: 更新知识层

- **目标**: 将经验同步到知识层文档
- **输入**: lessons-learned.md
- **输出**: knowledge-index.md 更新
- **验证**: 知识层出现本 feature 的明确条目
- **依赖**: Task 10
- **状态**: completed

### Task 12: 评估 archive

- **目标**: 判断本 feature 是否满足归档条件
- **输入**: PROJECT_RULES.md Section 4.1 归档条件
- **输出**: archive 结论或 remaining blockers
- **验证**: 状态判定有理有据
- **依赖**: Task 11
- **状态**: completed

---

## 任务依赖图

```
Task 1 → Task 2 → Task 3 → Task 4 → Task 5 → Task 6 → Task 9 → Task 10 → Task 11 → Task 12
                        └→ Task 7 ┘
                        └→ Task 8 ┘
```

---

## 进度统计

- 总任务数: 12
- 已完成: 12
- 进行中: 0
- 待处理: 0