# Spec: skill-execution

## Overview

本 spec 定义 004-skill-execution 的具体需求和验收标准。核心目标是通过"指南 + 脚本"方式解决 skill 工具无法调用自定义 skill 的问题。

---

## Requirements

### Functional Requirements

#### FR-1 Skill 执行指南文档

必须创建 `docs/guides/skill-execution-guide.md`，包含：

- 如何手动执行 skill（读取 SKILL.md 步骤）
- 如何使用脚本执行 skill
- 各 skill 的输入/输出说明

#### FR-2 执行脚本

必须创建以下脚本：

- `.superpowers/scripts/feature-start.sh` - 创建新 feature
- `.superpowers/scripts/feature-archive.sh` - 归档 feature
- `.superpowers/scripts/feature-status.sh` - 查询 feature 状态

#### FR-3 AGENTS.md 更新

AGENTS.md 必须包含"如何执行 Skill"章节，说明：

- skill 工具的限制
- 手动执行方式
- 脚本执行方式

---

### Non-Functional Requirements

#### NFR-1 脚本可移植性

脚本应使用 POSIX shell 语法，可在 bash 和 zsh 中运行。

#### NFR-2 脚本可读性

脚本应包含注释，说明每一步的作用。

#### NFR-3 文档完整性

指南文档应足够详细，让新的 AI 会话能理解如何执行 skill。

---

## Acceptance Scenarios

### AS-1 指南文档可用

**Given** docs/guides/ 目录存在  
**When** 读取 skill-execution-guide.md  
**Then** 文档包含手动和脚本两种执行方式  
**And** 每个 skill 的输入输出说明清晰

### AS-2 feature-start.sh 可执行

**Given** 脚本已创建  
**When** 执行 `./feature-start.sh 005-test-feature "Test Feature"`  
**Then** 创建 `openspec/changes/005-test-feature/` 目录  
**And** 生成 proposal.md, tasks.md, runstate.md

### AS-3 feature-archive.sh 可执行

**Given** feature 已完成  
**When** 执行 `./feature-archive.sh 005-test-feature`  
**Then** feature 移动到 `openspec/archive/005-test-feature/`

### AS-4 feature-status.sh 可执行

**Given** 存在活跃 feature  
**When** 执行 `./feature-status.sh`  
**Then** 显示所有 feature 的当前状态

### AS-5 AGENTS.md 包含 skill 说明

**Given** AGENTS.md 存在  
**When** 读取文件  
**Then** 包含"如何执行 Skill"章节

---

## Edge Cases

1. **脚本参数缺失**: 应显示用法说明
2. **feature-id 已存在**: feature-start.sh 应报错
3. **feature 不存在**: feature-archive.sh 应报错

---

## Constraints

- 脚本不依赖外部工具（仅使用标准 shell 命令）
- 脚本路径相对项目根目录
- 文档使用中文

---

## Out of Scope

- 修改 OpenCode 源码
- 创建 Windows batch 脚本（可后续添加）
- 创建复杂的 CLI 框架