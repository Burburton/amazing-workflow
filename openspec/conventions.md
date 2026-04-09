# OpenSpec Conventions

本文档定义 OpenSpec 侧的统一约定。

---

## 1. Feature 编号规范

### 格式
```
NNN-semantic-name
```

### 示例
- `001-governance-foundation`
- `002-user-auth`
- `003-session-management`

### 规则
- 序号从 001 开始，连续递增
- 使用小写字母和连字符
- 语义名称简洁明了（2-4 个单词）

---

## 2. Spec 写法规范

### 必需字段

```markdown
## Overview
<!-- 功能概述 -->

## Requirements
<!-- 功能需求列表 -->

## Acceptance Scenarios
<!-- 验收场景（Given/When/Then） -->

## Edge Cases
<!-- 边界情况 -->

## Constraints
<!-- 约束条件 -->

## Out of Scope
<!-- 不包含的内容 -->
```

### 写法要求
- 使用主动语态
- 需求可验证
- 场景具体化

---

## 3. Proposal 写法规范

### 必需字段

```markdown
## 背景
<!-- 为什么需要这个 feature -->

## 问题陈述
<!-- 要解决什么问题 -->

## 目标
<!-- 要达成什么 -->

## 非目标
<!-- 明确不做什么 -->

## 成功标准
<!-- 如何判断成功 -->
```

---

## 4. Tasks 写法规范

### 任务格式

```markdown
### Task N: 任务标题

- **目标**: 这个任务要达成什么
- **输入**: 需要什么输入
- **输出**: 产出什么
- **验证**: 如何验证完成
- **依赖**: 依赖哪些任务
- **状态**: pending | in_progress | completed
```

### 任务粒度
- 每个任务 2-5 分钟可完成
- 任务独立可验证
- 任务间依赖明确

---

## 5. Runstate 写法规范

### 必需字段

```markdown
| 字段 | 值 |
|------|-----|
| 当前阶段 | proposed | specified | planned | implementing | verifying | completed |
| 已完成 | 已完成的任务列表 |
| 进行中 | 正在进行的任务 |
| 待处理 | 待处理的任务 |
| 阻塞点 | 当前阻塞（如有） |
| 下一步动作 | 下一步要做什么 |
```

### 更新规则
- 每个阶段必须更新
- 阻塞时必须记录
- 下一步动作必须明确

---

## 6. 命名规范

### 文件命名
- `proposal.md` - feature 提案
- `tasks.md` - 任务清单
- `runstate.md` - 运行状态
- `spec.md` - 规格文档
- `design.md` - 设计文档

### 目录命名
- `openspec/changes/NNN-name/` - 活跃 feature
- `openspec/archive/NNN-name/` - 已归档 feature
- `specs/domain/` - spec 子目录

---

## 7. 归档规则

### 归档检查清单
- [ ] proposal 完整
- [ ] spec 完整
- [ ] tasks 全部关闭
- [ ] runstate 已收尾
- [ ] summary 已完成
- [ ] knowledge-index 已更新

### 归档流程
1. 确认所有检查项完成
2. 移动目录到 `openspec/archive/`
3. 更新 `knowledge-index.md`

---

## 8. 模板位置

所有模板存放在 `openspec/templates/`:
- `proposal.template.md`
- `tasks.template.md`
- `runstate.template.md`