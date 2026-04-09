# Feature Lifecycle

本文档定义 feature 从创建到归档的完整生命周期。

---

## 生命周期阶段

```
idea → proposed → specified → planned → implementing → verifying → completed → archived
```

---

## 阶段详情

### 1. idea → proposed

**触发**: 用户提出新需求

**命令**: `/feature-start`

**产出**:
- `openspec/changes/<feature-id>/proposal.md`
- `openspec/changes/<feature-id>/tasks.md`（空模板）
- `openspec/changes/<feature-id>/runstate.md`
- `openspec/changes/<feature-id>/specs/`（空目录）

**检查点**:
- [ ] feature-id 格式正确
- [ ] 目录已创建
- [ ] proposal 已填写

---

### 2. proposed → specified

**触发**: proposal 完成并评审通过

**命令**: `/feature-spec`

**产出**:
- `openspec/changes/<feature-id>/specs/<domain>/spec.md`
- proposal 校验报告

**检查点**:
- [ ] proposal 必需字段完整
- [ ] spec 子目录已创建
- [ ] spec 内容已填写

---

### 3. specified → planned

**触发**: spec 完成并评审通过

**命令**: `/feature-tasks`

**产出**:
- 更新后的 `tasks.md`（包含任务列表）

**检查点**:
- [ ] 任务粒度合适（2-5 分钟）
- [ ] 任务依赖关系明确
- [ ] 每个任务可验证

---

### 4. planned → implementing

**触发**: tasks 完成并准备开始实现

**命令**: `/feature-implement`

**产出**:
- 实现代码
- 更新后的 `runstate.md`

**检查点**:
- [ ] 固定输入包已加载
- [ ] 每个任务完成后更新状态
- [ ] 阻塞点已记录

---

### 5. implementing → verifying

**触发**: 实现完成

**命令**: `/feature-verify`

**产出**:
- 测试执行结果
- 验证报告

**检查点**:
- [ ] 测试通过
- [ ] 成功标准满足
- [ ] 已知缺口已记录

---

### 6. verifying → completed

**触发**: 验证通过

**命令**: `/feature-close`

**产出**:
- implementation-summary
- lessons-learned
- 更新后的 `knowledge-index.md`

**检查点**:
- [ ] summary 已完成
- [ ] lessons 已提取
- [ ] 知识索引已更新

---

### 7. completed → archived

**触发**: feature 完成并准备归档

**命令**: `/feature-archive`

**产出**:
- 移动到 `openspec/archive/<feature-id>/`
- 更新后的 `knowledge-index.md`

**检查点**:
- [ ] 所有归档条件满足
- [ ] 目录已移动
- [ ] 归档记录已添加

---

## 状态转换图

```
                    ┌─────────────────────────────────────────────────┐
                    │                                                 │
                    ▼                                                 │
idea ─────► proposed ─────► specified ─────► planned ─────► implementing
                                                              │
                                                              │
                                                              ▼
archived ◄──── completed ◄──── verifying ◄────────────────────┘
```

---

## 必读文件映射

| 阶段 | 必读文件 |
|------|----------|
| proposed | AGENTS.md, PROJECT_RULES.md, proposal.md |
| specified | proposal.md, specs/*/spec.md |
| planned | proposal.md, specs/*/spec.md, tasks.md |
| implementing | 全部输入包 |
| verifying | runstate.md, tasks.md |
| completed | runstate.md, implementation-summary |
| archived | knowledge-index.md |