# Lessons Learned

## 元信息

- **Feature ID**: 002-workflow-dogfooding
- **完成日期**: 2026-04-10
- **作者**: AI (Sisyphus)

---

## 1. 成功做法

### 1.1 流程层面

| 做法 | 效果 |
|------|------|
| **严格按阶段推进** | idea → proposed → specified → planned → implementing → verifying，每阶段都有明确输入输出 |
| **runstate 持续更新** | 每次阶段变更都记录在 runstate.md，支持会话续接 |
| **文档拆分而非复制** | 将长 spec 文档拆分为 proposal + spec + tasks，更符合模板结构 |
| **验证为主，修复为次** | 遵循"发现缺口先记录"原则，避免 feature 范围失控 |

### 1.2 技术层面

| 做法 | 效果 |
|------|------|
| **手动执行 SKILL.md** | 当 skill 工具不支持时，读取 SKILL.md 手动执行仍可行 |
| **模板字段扩展** | runstate.md 添加"Dogfooding 观察记录"字段，灵活扩展模板 |

---

## 2. 失败点

| 问题 | 原因 | 改进措施 |
|------|------|----------|
| **skill 工具无法调用自定义 skill** | OpenCode skill 工具只支持内置 skill | 需在项目层面解决或提供替代方案（003 feature） |
| **知识文件缺失** | reusable-patterns.md 等未创建 | 下一 feature 创建这些文件 |
| **tasks 状态未同步** | tasks.md 和 runstate.md 状态不一致 | 明确两者关系和同步规则 |

---

## 3. 可复用模式

### 模式 1: Dogfooding 验证模式

**来源**: 002-workflow-dogfooding

**模式描述**:
用一个真实 feature 验证治理框架的完整闭环，而非仅依赖文档审查。核心原则：
1. 验证为主，修复为次
2. 发现缺口先记录，不立即修复
3. 产出问题清单供后续 feature 使用

**适用场景**:
- 验证新建立的治理框架
- 验证工作流定义的可用性
- 验证命令/skill 的实际执行效果

**执行步骤**:
```
1. 启动验证 feature (feature-start)
2. 定义验证目标 (proposal/spec)
3. 拆解验证任务 (tasks)
4. 执行验证工作 (implement)
5. 生成验证报告 (verify)
6. 总结发现的问题 (close)
7. 沉淀知识 (knowledge-index)
```

---

### 模式 2: 文档拆分模式

**来源**: 002-workflow-dogfooding

**模式描述**:
当输入文档过于完整（如 567 行 spec），不直接复制，而是拆分到模板结构：
- 背景目标 → proposal.md
- 需求验收 → spec.md
- 任务拆解 → tasks.md

**适用场景**:
- 输入文档超出单个模板容量
- 需验证模板是否够用
- 保持 feature 目录结构一致

---

## 4. 技术决策

| 决策 | 理由 | 替代方案 |
|------|------|----------|
| **不创建缺失知识文件** | 遵循"验证为主"原则 | 创建文件会偏离 dogfooding 目标 |
| **手动执行 SKILL.md** | skill 工具不支持自定义 skill | 等待 OpenCode 支持（会阻塞进度） |

---

## 5. 对后续 feature 的建议

1. **003 feature 应优先解决 skill 工具调用问题** - 这是最阻塞的缺口
2. **创建缺失知识文件** - reusable-patterns.md, common-failures.md, decision-history.md
3. **添加 tasks.md 状态同步规则** - 明确与 runstate.md 的关系
4. **验证会话中断续接** - 需专门测试场景
5. **保持阶段推进的严格性** - 本次 dogfooding 证明阶段流转有效

---

## 6. 应进入项目知识层的内容

### 可复用模式

- [x] **Dogfooding 验证模式** - 用真实 feature 验证治理框架
- [x] **文档拆分模式** - 将长文档拆分到模板结构

### 常见问题

- [x] **skill 工具无法调用自定义 skill** - 需手动执行 SKILL.md
- [x] **知识文件缺失** - reusable-patterns.md 等未创建

### 决策记录

- [x] **验证为主，修复为次** - dogfooding 的核心原则

---

## 审批

- [x] Lessons 已完成
- [ ] 知识已同步到 knowledge-index（待执行）