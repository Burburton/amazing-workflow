---
name: feature-start
description: "创建新的 feature 目录并初始化基础文件"
---

# /feature-start

创建新的 feature 目录并初始化基础文件。

## 功能

创建 `openspec/changes/<feature-id>/` 目录结构，生成基于模板的基础文件。

## 输入

- `feature-id`: 三位序号+语义名称（如 `002-user-auth`）
- `feature-title`: feature 标题

## 输出

- `openspec/changes/<feature-id>/proposal.md`（基于模板）
- `openspec/changes/<feature-id>/tasks.md`（基于模板）
- `openspec/changes/<feature-id>/runstate.md`（初始状态）
- `openspec/changes/<feature-id>/specs/`（空目录）

## 执行步骤

1. **验证 feature-id 格式**
   - 必须是 `NNN-semantic-name` 格式
   - 序号必须连续

2. **检查是否已存在同名目录**
   - 如存在，提示用户选择不同名称

3. **创建目录结构**
   ```
   mkdir -p openspec/changes/<feature-id>/specs
   ```

4. **复制模板文件**
   - 复制 `proposal.template.md` → `proposal.md`
   - 复制 `tasks.template.md` → `tasks.md`
   - 复制 `runstate.template.md` → `runstate.md`

5. **替换模板变量**
   - `{feature-id}` → 实际 feature-id
   - `{date}` → 当前日期
   - `{task-title}` → feature-title

6. **初始化 runstate**
   - 当前阶段: `proposed`
   - 下一步动作: 填写 proposal.md

7. **提示用户**
   - 请填写 `proposal.md` 中的背景、问题、目标等字段

## 示例

```
输入: feature-id=002-logging-system, feature-title=日志系统

输出:
- 创建 openspec/changes/002-logging-system/
- 生成 proposal.md, tasks.md, runstate.md
- 创建 specs/ 空目录
```

## 错误处理

- feature-id 格式错误 → 提示正确格式
- 目录已存在 → 提示选择不同名称
- 模板文件不存在 → 先检查模板目录