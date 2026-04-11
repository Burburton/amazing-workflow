# Spec: archive

## Overview

增强 `.superpowers/scripts/feature-archive.sh` 脚本，实现归档流程的完整自动化：
1. 验证 feature 状态（必须是 completed 或 verifying 通过）
2. 移动目录到 archive
3. 自动更新 runstate.md 为 archived
4. 自动更新 knowledge-index.md
5. 自动执行 git commit

## Requirements

### REQ-1: 状态验证

脚本在执行归档前必须验证 feature 状态：
- 检查 `runstate.md` 中"当前阶段"字段
- 只允许 `completed` 或 `verifying` 状态的 feature 归档
- 如状态不符，提示用户先完成验证

### REQ-2: 目录移动

保持现有逻辑：
- 移动 `openspec/changes/<feature-id>` → `openspec/archive/<feature-id>`
- 检查目标目录不存在（防止覆盖）

### REQ-3: runstate.md 自动更新

增强现有逻辑：
- 更新"当前阶段"为 `archived`
- 更新状态表格："已完成"字段改为空（或保留历史），"下一步动作"改为 `-`
- 添加变更历史记录：`completed → archived | 移动到 openspec/archive/`

### REQ-4: knowledge-index.md 自动更新

新增功能：
- 在 Feature 索引表格添加新行
- 格式：`| {feature-id} | {name} | archived | {date} | {主要贡献} |`
- 主要贡献从 `implementation-summary.md` 或 `proposal.md` 提取

### REQ-5: Git 自动提交

新增功能：
- 执行 `git add -A`
- 执行 `git commit -m "archive({feature-id}): complete feature lifecycle"`
- 可选：询问用户是否 push

### REQ-6: 错误处理与回滚

新增功能：
- 如任何步骤失败，输出错误并停止
- 不执行自动回滚（git 可手动 revert）
- 提供清晰的错误信息和下一步建议

## Acceptance Scenarios

### AS-1: 正常归档流程

**输入**: feature-id=007-auto-archive, 当前阶段=completed

**执行**:
```bash
npm run feature:archive 007-auto-archive
```

**输出**:
1. ✅ 验证状态通过
2. ✅ 目录移动成功
3. ✅ runstate.md 更新为 archived
4. ✅ knowledge-index.md 添加记录
5. ✅ Git commit 执行成功
6. ✅ 提示归档完成

### AS-2: 状态不符拒绝归档

**输入**: feature-id=007-auto-archive, 当前阶段=implementing

**执行**:
```bash
npm run feature:archive 007-auto-archive
```

**输出**:
1. ❌ 验证状态失败
2. ❌ 提示"当前阶段为 implementing，请先完成验证"
3. ❌ 脚本退出，不执行任何变更

### AS-3: Git 操作失败

**输入**: feature 有未提交的更改（脏工作区）

**执行**:
```bash
npm run feature:archive 007-auto-archive
```

**输出**:
1. ✅ 目录移动成功
2. ✅ 文件更新成功
3. ⚠️ Git commit 失败（有冲突或其他问题）
4. ⚠️ 提示手动执行 `git add -A && git commit -m "..."`

## Edge Cases

### EC-1: feature-id 不存在

- 提示可用 feature 列表
- 退出脚本

### EC-2: archive 目录已存在

- 提示"已归档，无需重复操作"
- 退出脚本

### EC-3: knowledge-index.md 格式异常

- 提示"无法自动更新 knowledge-index.md"
- 提示手动添加记录
- 继续其他步骤

### EC-4: runstate.md 格式异常

- 提示"无法自动更新 runstate.md"
- 提示手动更新
- 继续其他步骤

## Constraints

### CON-1: 跨平台兼容

脚本需兼容 macOS 和 Linux（bash）：
- `sed -i` 在 macOS 需要 `sed -i ''`
- 使用条件判断或 `awk` 替代

### CON-2: 无外部依赖

脚本只使用 bash 内置命令和常见工具（sed, awk, grep, git）：
- 不引入 Python、Node.js 等依赖

### CON-3: 保持向后兼容

增强脚本时保持现有参数和输出格式：
- `./feature-archive.sh <feature-id>` 用法不变
- 输出信息保持清晰友好

## Out of Scope

- CI/CD 自动归档（保持本地脚本）
- 归档后删除源文件（保留完整历史）
- 自动 push（改为可选询问）
- feature 全生命周期自动化（仅关注归档阶段）

## Implementation Notes

### 文件结构

```
.superpowers/scripts/
├─ feature-archive.sh    # 增强归档脚本
├─ archive-helper.sh     # 辅助函数（可选）
```

### npm scripts

```json
{
  "scripts": {
    "feature:archive": "bash .superpowers/scripts/feature-archive.sh"
  }
}
```

### 核心逻辑流程

```
验证状态 → 移动目录 → 更新 runstate → 更新 knowledge-index → git commit → 输出总结
```