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

**重要流程: 决策固化**

在 spec 填写过程中，如果发现模糊点（如字数定义、日期格式、输出格式），**禁止直接假设或猜测**。必须执行决策固化流程：

1. **识别模糊点** - 标记 spec 中多处可解释的描述
2. **分析可选方案** - 列出至少 2-3 种实现方式
3. **评估方案** - 从可用性、可扩展性、兼容性角度评估
4. **选择最优方案** - 记录选择理由和放弃的替代方案
5. **固化到 spec** - 更新 spec 文件，明确描述选定的方案
6. **记录决策** - 在 spec 或 decision-history.md 中记录

**示例**:
```
模糊点: "字数统计"（可能指单词数、字符数、混合）

分析:
- 方案 A: 英文单词数 → 中文内容不可用
- 方案 B: 字符数 → 不语义化
- 方案 C: 智能混合 → 中文/英文都可用

选择: 方案 C
理由: 可用性最高，后续可配置

固化到 spec:
"字数统计采用智能混合方式：英文按单词，中文按字符"
```

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
| specified | proposal.md, specs/*/spec.md（含决策固化） |
| planned | proposal.md, specs/*/spec.md, tasks.md |
| implementing | 全部输入包 |
| verifying | runstate.md, tasks.md |
| completed | runstate.md, implementation-summary |
| archived | knowledge-index.md |

---

## 新项目初始化指南

### 快速启动流程

创建新项目时，可快速复制 amazing-workflow 框架结构：

1. **复制模板文件**
   ```
   mkdir -p openspec/templates openspec/changes openspec/archive
   mkdir -p docs/knowledge docs/workflows
   mkdir -p .superpowers/skills
   
   # 从 amazing-workflow 复制模板
   cp amazing-workflow/openspec/templates/*.md openspec/templates/
   ```

2. **创建项目入口文件**
   - `AGENTS.md` - AI 项目入口（参考 amazing-workflow/AGENTS.md）
   - `PROJECT_RULES.md` - 项目规则（根据技术栈调整）
   - `openspec/project.md` - 项目目标

3. **创建知识目录结构**
   ```
   docs/knowledge/
     - knowledge-index.md
     - reusable-patterns.md
     - decision-history.md
   ```

4. **初始化 git 仓库**
   ```
   git init
   git add -A
   git commit -m "init: project setup with OpenSpec governance framework"
   ```

5. **开始第一个 feature**
   ```
   创建 openspec/changes/001-<feature-name>/
   填写 proposal.md, spec.md, tasks.md, runstate.md
   ```

### 新项目模板

参考 `openspec/templates/new-project.template.md` 获取完整结构模板。

---