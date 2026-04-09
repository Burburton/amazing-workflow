---
name: feature-spec
description: "校验 proposal 并生成 specs 子目录"
---

# /feature-spec

校验 proposal 并生成 specs 子目录。

## 功能

读取并校验 proposal.md，为每个子域创建 spec.md 模板。

## 输入

- `feature-id`: 已存在的 feature 目录

## 输出

- `openspec/changes/<feature-id>/specs/<domain>/spec.md`
- 校验报告

## 执行步骤

1. **读取 proposal.md**
   - 检查必需字段是否存在
   - 目标、问题陈述、成功标准必须填写

2. **校验必需字段**
   - 背景 ✓/✗
   - 问题陈述 ✓/✗
   - 目标 ✓/✗
   - 成功标准 ✓/✗

3. **询问用户需要的 spec 子目录**
   - "请列出需要创建的 spec 子域（如 auth, api, ui）"

4. **创建 spec 子目录和文件**
   ```
   mkdir -p openspec/changes/<feature-id>/specs/<domain>
   创建 spec.md 模板
   ```

5. **更新 runstate**
   - 当前阶段: `specified`
   - 下一步动作: 填写 spec 内容

## Spec 模板

```markdown
# Spec: {domain}

## Overview
<!-- 功能概述 -->

## Requirements
<!-- 功能需求 -->

## Acceptance Scenarios
<!-- 验收场景 -->

## Edge Cases
<!-- 边界情况 -->

## Constraints
<!-- 约束条件 -->

## Out of Scope
<!-- 不包含的内容 -->
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 校验 proposal.md 通过
- 创建 specs/logging/spec.md
- 更新 runstate 为 specified
```