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

### 核心模板（第一阶段）
- `proposal.template.md` - feature 提案
- `tasks.template.md` - 任务清单
- `runstate.template.md` - 运行状态

### 扩展模板（第二阶段）
- `design.template.md` - 设计文档
- `implementation-summary.template.md` - 实现总结
- `test-summary.template.md` - 测试总结
- `lessons-learned.template.md` - 经验教训

---

## 9. 状态文件关系

### tasks.md 与 runstate.md 的职责

| 文件 | 职责 | 粒度 | 更新频率 |
|------|------|------|----------|
| tasks.md | 任务拆解和执行状态 | 单个任务 | 任务完成时 |
| runstate.md | feature 整体阶段和续接信息 | 整体阶段 | 阶段变更时 |

### 具体分工

**tasks.md 负责**:
- 任务列表和依赖关系
- 每个任务的详细状态（pending/in_progress/completed）
- 任务级别的输入、输出、验证

**runstate.md 负责**:
- feature 的当前阶段（proposed/specified/planned/implementing/verifying/completed/archived）
- 整体进度概览（已完成/进行中/待处理任务列表）
- 阻塞点和下一步动作
- 会话续接所需的关键信息

### 同步规则

1. **tasks.md 更新时** → runstate.md 的"已完成/进行中/待处理"字段应同步更新
2. **阶段变更时** → runstate.md 必须更新"当前阶段"字段
3. **遇到阻塞时** → 只在 runstate.md 记录，tasks.md 保持任务状态不变

### 示例

**tasks.md 中的任务状态**:
```markdown
### Task 1: 创建目录

- **状态**: completed

### Task 2: 编写 proposal

- **状态**: in_progress

### Task 3: 编写 spec

- **状态**: pending
```

**runstate.md 中的整体状态**:
```markdown
| 字段 | 值 |
|------|-----|
| 当前阶段 | specified |
| 已完成 | Task 1 |
| 进行中 | Task 2 |
| 待处理 | Task 3-8 |
| 阻塞点 | 无 |
| 下一步动作 | 完成 Task 2 后进入 planned 阶段 |
```

### 为什么需要两个文件

1. **tasks.md 是静态规划** - 定义"要做什么"
2. **runstate.md 是动态状态** - 记录"做到哪了"
3. **分离关注点** - 规划和状态追踪分开，便于维护
4. **支持续接** - runstate.md 提供会话恢复入口，tasks.md 提供执行细节