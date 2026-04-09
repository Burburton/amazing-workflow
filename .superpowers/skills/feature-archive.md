---
name: feature-archive
description: "归档 feature"
---

# /feature-archive

归档 feature。

## 功能

检查 feature 是否满足归档条件，移动到 archive 目录，更新知识索引。

## 输入

- `feature-id`: 已完成的 feature

## 输出

- 移动目录到 `openspec/archive/<feature-id>/`
- 更新后的 `knowledge-index.md`

## 执行步骤

1. **检查归档条件**
   - [ ] proposal 完整
   - [ ] spec 完整
   - [ ] tasks 全部关闭
   - [ ] runstate 已收尾
   - [ ] summary 已完成
   - [ ] knowledge-index 已更新

2. **处理未满足条件**
   - 如有条件未满足，提示用户先完成

3. **移动目录**
   ```
   mv openspec/changes/<feature-id> openspec/archive/<feature-id>
   ```

4. **更新知识索引**
   - 添加归档记录
   - 更新 feature 状态

5. **更新 runstate**
   - 当前阶段: `archived`

## 归档记录格式

```markdown
## 归档记录

- **Feature ID**: {feature-id}
- **归档日期**: {date}
- **主要贡献**: ...
- **相关模式**: ...
```

## 示例

```
输入: feature-id=002-logging-system

检查:
- proposal 完整 ✓
- spec 完整 ✓
- tasks 全部关闭 ✓
- runstate 已收尾 ✓
- summary 已完成 ✓
- knowledge-index 已更新 ✓

执行:
- 移动到 openspec/archive/002-logging-system/
- 更新 knowledge-index.md
- 更新 runstate 为 archived
```