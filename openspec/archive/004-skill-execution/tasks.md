# Feature Tasks

## 元信息

- **Feature ID**: 004-skill-execution
- **更新日期**: 2026-04-10
- **状态**: planned

---

## 任务列表

### Task 1: 创建 skill 执行指南文档

- **目标**: 创建详细的 skill 执行指南
- **输入**: .superpowers/skills/*/SKILL.md
- **输出**: docs/guides/skill-execution-guide.md
- **验证**: 文档包含手动执行和脚本执行两种方式
- **依赖**: 无
- **状态**: completed

### Task 2: 创建 scripts 目录结构

- **目标**: 创建脚本存放目录
- **输入**: 无
- **输出**: .superpowers/scripts/ 目录
- **验证**: 目录存在
- **依赖**: 无
- **状态**: completed

### Task 3: 创建 feature-start.sh 脚本

- **目标**: 创建 feature-start 执行脚本
- **输入**: .superpowers/skills/feature-start/SKILL.md
- **输出**: .superpowers/scripts/feature-start.sh
- **验证**: 脚本可执行，能创建 feature 目录
- **依赖**: Task 2
- **状态**: completed

### Task 4: 创建 feature-archive.sh 脚本

- **目标**: 创建 feature-archive 执行脚本
- **输入**: .superpowers/skills/feature-archive/SKILL.md
- **输出**: .superpowers/scripts/feature-archive.sh
- **验证**: 脚本可执行，能移动 feature 到归档目录
- **依赖**: Task 2
- **状态**: completed

### Task 5: 创建 feature-status.sh 脚本

- **目标**: 创建 feature 状态查询脚本
- **输入**: 无
- **输出**: .superpowers/scripts/feature-status.sh
- **验证**: 脚本可显示当前 feature 状态
- **依赖**: Task 2
- **状态**: completed

### Task 6: 更新 AGENTS.md 添加 skill 使用说明

- **目标**: 在 AI 入口文件中添加 skill 使用说明
- **输入**: skill 执行指南
- **输出**: 更新后的 AGENTS.md
- **验证**: 包含"如何执行 Skill"章节
- **依赖**: Task 1
- **状态**: completed

### Task 7: 更新 knowledge-index.md

- **目标**: 同步新文档到知识索引
- **输入**: 新创建的文件
- **输出**: 更新后的 knowledge-index.md
- **验证**: 包含新条目
- **依赖**: Task 1, Task 3-5
- **状态**: completed

### Task 8: 生成 test-summary 和 lessons-learned

- **目标**: 总结 feature
- **输入**: 整个实现过程
- **输出**: test-summary.md, lessons-learned.md
- **验证**: 内容完整
- **依赖**: Task 1-7
- **状态**: completed

### Task 9: 归档 feature

- **目标**: 移动到 archive 目录
- **输入**: 所有完成的文件
- **输出**: openspec/archive/004-skill-execution/
- **验证**: 目录结构完整
- **依赖**: Task 8
- **状态**: pending

### Task 2: 创建 scripts 目录结构

- **目标**: 创建脚本存放目录
- **输入**: 无
- **输出**: .superpowers/scripts/ 目录
- **验证**: 目录存在
- **依赖**: 无
- **状态**: pending

### Task 3: 创建 feature-start.sh 脚本

- **目标**: 创建 feature-start 执行脚本
- **输入**: .superpowers/skills/feature-start/SKILL.md
- **输出**: .superpowers/scripts/feature-start.sh
- **验证**: 脚本可执行，能创建 feature 目录
- **依赖**: Task 2
- **状态**: pending

### Task 4: 创建 feature-archive.sh 脚本

- **目标**: 创建 feature-archive 执行脚本
- **输入**: .superpowers/skills/feature-archive/SKILL.md
- **输出**: .superpowers/scripts/feature-archive.sh
- **验证**: 脚本可执行，能移动 feature 到归档目录
- **依赖**: Task 2
- **状态**: pending

### Task 5: 创建 feature-status.sh 脚本

- **目标**: 创建 feature 状态查询脚本
- **输入**: 无
- **输出**: .superpowers/scripts/feature-status.sh
- **验证**: 脚本可显示当前 feature 状态
- **依赖**: Task 2
- **状态**: pending

### Task 6: 更新 AGENTS.md 添加 skill 使用说明

- **目标**: 在 AI 入口文件中添加 skill 使用说明
- **输入**: skill 执行指南
- **输出**: 更新后的 AGENTS.md
- **验证**: 包含"如何执行 skill"章节
- **依赖**: Task 1
- **状态**: pending

### Task 7: 更新 knowledge-index.md

- **目标**: 同步新文档到知识索引
- **输入**: 新创建的文件
- **输出**: 更新后的 knowledge-index.md
- **验证**: 包含新条目
- **依赖**: Task 1, Task 3-5
- **状态**: pending

### Task 8: 生成 test-summary 和 lessons-learned

- **目标**: 总结 feature
- **输入**: 整个实现过程
- **输出**: test-summary.md, lessons-learned.md
- **验证**: 内容完整
- **依赖**: Task 1-7
- **状态**: pending

### Task 9: 归档 feature

- **目标**: 移动到 archive 目录
- **输入**: 所有完成的文件
- **输出**: openspec/archive/004-skill-execution/
- **验证**: 目录结构完整
- **依赖**: Task 8
- **状态**: pending

---

## 任务依赖图

```
Task 1 ─────→ Task 6 ─────┐
Task 2 ─┬→ Task 3 ────────┼→ Task 7 → Task 8 → Task 9
        ├→ Task 4 ────────┤
        └→ Task 5 ────────┘
```

---

## 进度统计

- 总任务数: 9
- 已完成: 8
- 进行中: 0
- 待处理: 1