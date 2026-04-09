---
name: feature-close
description: "收尾 feature，生成总结并更新知识索引"
---

# /feature-close

收尾 feature，生成总结并更新知识索引。

## 功能

生成 implementation-summary 和 lessons-learned，同步知识到 knowledge-index。

## 输入

- `feature-id`: 已验证的 feature

## 输出

- implementation-summary（写入 runstate）
- lessons-learned（写入 runstate）
- 更新后的 `knowledge-index.md`

## 执行步骤

1. **生成实现总结**
   - 实际完成了什么
   - 与设计的偏差
   - 新增/修改文件清单

2. **提取经验教训**
   - 成功做法
   - 失败点
   - 可复用模式

3. **更新知识索引**
   - 添加 feature 记录
   - 同步可复用模式
   - 同步常见问题

4. **更新 runstate**
   - 当前阶段: `completed`
   - 标记完成时间

## Summary 格式

```markdown
## Implementation Summary

- **完成日期**: {date}
- **实际完成**:
  - 功能 1
  - 功能 2
- **偏离设计**:
  - 偏差 1: 原因
- **文件变更**:
  - 新增: file1, file2
  - 修改: file3

## Lessons Learned

- **成功做法**: ...
- **失败点**: ...
- **可复用模式**: ...
```

## 示例

```
输入: feature-id=002-logging-system

输出:
- 生成 implementation-summary
- 生成 lessons-learned
- 更新 knowledge-index.md
- 更新 runstate 为 completed
```