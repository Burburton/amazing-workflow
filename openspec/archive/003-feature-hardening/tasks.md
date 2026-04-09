# Feature Tasks

## 元信息

- **Feature ID**: 003-feature-hardening
- **更新日期**: 2026-04-10
- **状态**: planned

---

## 任务列表

### Task 1: 创建 reusable-patterns.md

- **目标**: 创建可复用模式知识文件
- **输入**: knowledge-index.md 中的模式部分
- **输出**: docs/knowledge/reusable-patterns.md
- **验证**: 文件存在，包含至少 4 个模式
- **依赖**: 无
- **状态**: completed

### Task 2: 创建 common-failures.md

- **目标**: 创建常见问题知识文件
- **输入**: knowledge-index.md 中的问题部分
- **输出**: docs/knowledge/common-failures.md
- **验证**: 文件存在，包含至少 4 个问题
- **依赖**: 无
- **状态**: completed

### Task 3: 创建 decision-history.md

- **目标**: 创建决策历史知识文件
- **输入**: knowledge-index.md 中的决策部分
- **输出**: docs/knowledge/decision-history.md
- **验证**: 文件存在，包含至少 4 条决策
- **依赖**: 无
- **状态**: completed

### Task 4: 更新 conventions.md 明确 tasks/runstate 关系

- **目标**: 在规范中明确 tasks.md 与 runstate.md 的职责边界
- **输入**: 当前实践经验和 002 的发现
- **输出**: 更新后的 openspec/conventions.md
- **验证**: 新增"状态文件关系"章节
- **依赖**: 无
- **状态**: completed

### Task 5: 更新 runstate 模板添加扩展字段

- **目标**: 在模板中添加扩展字段建议，鼓励合理自定义
- **输入**: 002 中使用的"观察记录"字段
- **输出**: 更新后的 openspec/templates/runstate.template.md
- **验证**: 包含"扩展字段"章节
- **依赖**: 无
- **状态**: completed

### Task 6: 更新 knowledge-index.md 指向新文件

- **目标**: 更新知识索引，指向新创建的知识文件
- **输入**: 新创建的 3 个知识文件
- **输出**: 更新后的 docs/knowledge/knowledge-index.md
- **验证**: 索引包含指向新文件的链接
- **依赖**: Task 1, Task 2, Task 3
- **状态**: completed

### Task 7: 生成 verification summary

- **目标**: 输出验证报告
- **输入**: 所有任务执行结果
- **输出**: test-summary.md
- **验证**: 包含通过项和验证结果
- **依赖**: Task 1-6
- **状态**: completed

### Task 8: 生成 implementation summary 和 lessons learned

- **目标**: 总结本次 feature 的结果
- **输入**: 整个实现过程
- **输出**: implementation-summary.md, lessons-learned.md
- **验证**: 内容完整
- **依赖**: Task 7
- **状态**: completed

### Task 9: 归档 feature

- **目标**: 将 feature 移动到 archive 目录
- **输入**: 完成的所有文件
- **输出**: 移动到 openspec/archive/003-feature-hardening/
- **验证**: 目录结构完整
- **依赖**: Task 8
- **状态**: completed

---

## 任务依赖图

```
Task 1 ─┬─→ Task 6 ─→ Task 7 ─→ Task 8 ─→ Task 9
Task 2 ─┤
Task 3 ─┘
Task 4 ─────────────────┘
Task 5 ─────────────────┘
```

---

## 进度统计

- 总任务数: 9
- 已完成: 9
- 进行中: 0
- 待处理: 0