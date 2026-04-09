# Governance Foundation 精简版设计文档

## 元信息

- **设计日期**: 2026-04-09
- **设计版本**: v1.0-精简版
- **基于**: `001-governance-foundation-feature-spec.md`
- **设计策略**: 精简核心化 - 第一阶段最小可用

---

## 1. 设计背景

### 1.1 原始 Spec 分析

**优点**:
- 结构完整，目标、范围、任务分解清晰
- 交付物清单明确，验收场景具体
- 三层分工理念正确（OpenSpec/Superpowers/项目规范层）

**潜在问题**:
- 文件数量过多（~30+），第一阶段可能过重
- 命令定义抽象，缺乏实际执行机制
- 模板内容未定义，只有框架
- AI 执行入口模糊，缺少 AGENTS.md 具体内容
- 缺少验证机制

### 1.2 设计决策

基于 brainstorming 对话，确定以下改进方向：

1. **精简核心化** - 第一阶段只保留 15-20 个核心文件
2. **AGENTS.md 作为项目总入口** - 包含目录、流程、规则摘要
3. **定义 OpenCode skill 命令** - 将 `/feature-start` 等命令实现为可执行 skill

---

## 2. 目录结构设计

### 2.1 精简版目录

```text
amazing-workflow/
├─ AGENTS.md              # 项目总入口（AI 进入必读）
├─ PROJECT_RULES.md       # 项目硬规则
├─ README.md              # 人类用户入口
│
├─ openspec/
│  ├─ project.md          # 项目级目标与范围
│  ├─ conventions.md      # OpenSpec 约定规则
│  ├─ templates/
│  │  ├─ proposal.template.md    # feature 提案模板
│  │  ├─ tasks.template.md       # 任务清单模板
│  │  └─ runstate.template.md    # 运行状态模板
│  ├─ changes/            # feature 变更目录（空）
│  └─ archive/            # 归档目录（空）
│
├─ docs/
│  ├─ workflows/
│  │  └─ feature-lifecycle.md   # feature 生命周期定义
│  ├─ knowledge/
│  │  └─ knowledge-index.md      # 知识沉淀索引
│  └─ standards/
│     └─ coding-standards.md     # 编码规范（占位）
│
├─ .superpowers/
│  ├─ context/
│  │  └─ execution-rules.md      # Superpowers 执行规则
│  ├─ checklists/
│  │  └─ implementation-checklist.md  # 实现检查清单
│  └─ skills/
│     ├─ feature-start.md        # /feature-start skill 定义
│     ├─ feature-spec.md         # /feature-spec skill 定义
│     ├─ feature-tasks.md        # /feature-tasks skill 定义
│     ├─ feature-implement.md    # /feature-implement skill 定义
│     ├─ feature-verify.md       # /feature-verify skill 定义
│     ├─ feature-close.md        # /feature-close skill 定义
│     └─ feature-archive.md      # /feature-archive skill 定义
│
└─ .opencode/
   └─ opencode.json        # OpenCode 项目配置（可选）
```

### 2.2 与原始 Spec 的差异

| 原始 Spec | 精简版 | 说明 |
|-----------|--------|------|
| 7 个模板文件 | 3 个核心模板 | design、summary、lessons-learned 模板移至后续迭代 |
| docs/architecture/ | 移除 | 后续迭代 |
| docs/domain/ | 移除 | 后续迭代 |
| docs/reports/ | 移除 | 后续迭代 |
| .superpowers/templates/ | 移除 | skill 定义替代 |
| 约定式命令 | OpenCode skill | 实际可执行命令 |

---

## 3. AGENTS.md 设计

### 3.1 定位

AGENTS.md 作为 **项目总入口**，是 AI 进入项目时的必读文件。

### 3.2 内容结构

```markdown
# AGENTS.md - AI 项目入口

## 1. 项目概述
- 项目名称、目标、核心价值
- 当前阶段（治理骨架搭建）

## 2. 目录结构速查
- 核心目录用途说明
- AI 应优先阅读的文件清单

## 3. Feature 生命周期
- idea → proposed → specified → planned → implementing → verifying → completed → archived
- 每阶段对应命令和必读文件

## 4. 工作规则
- OpenSpec 先行：不得跳过 proposal/spec/tasks 直接编码
- 状态维护：每个阶段必须更新 runstate.md
- 知识沉淀：feature 完成后同步到 knowledge-index.md

## 5. 必读文件清单（按优先级）
1. AGENTS.md（当前）
2. PROJECT_RULES.md
3. openspec/project.md
4. docs/workflows/feature-lifecycle.md
5. 当前 feature 的 proposal.md/tasks.md/runstate.md

## 6. 禁区
- 不允许跳过 spec 直接实现
- 不允许不更新 runstate 就继续工作
- 不允许随意改目录命名
```

---

## 4. OpenCode Skill 命令设计

### 4.1 命令列表

| Skill | 触发词 | 功能 |
|-------|--------|------|
| `/feature-start` | "创建新 feature" | 创建 feature 目录，生成基础文件 |
| `/feature-spec` | "细化 feature 规格" | 校验 proposal，生成 specs 子目录 |
| `/feature-tasks` | "拆解任务" | 基于 proposal/spec 生成 tasks.md |
| `/feature-implement` | "开始实现" | 加载输入包，按 tasks 执行 |
| `/feature-verify` | "验证完成" | 执行测试，生成 test-summary |
| `/feature-close` | "收尾 feature" | 生成 summary，标记 completed 阶段，更新 knowledge-index |
| `/feature-archive` | "归档 feature" | 移动到 archive，更新索引，标记 archived 阶段 |

### 4.2 Skill 文件格式

每个 skill 文件采用统一格式：

```markdown
---
name: feature-start
description: "创建新的 feature 目录并初始化基础文件"
---

# /feature-start

## 功能
创建 `openspec/changes/<feature-id>/` 目录结构

## 输入
- feature-id: 三位序号+语义名称（如 002-user-auth）
- feature-title: feature 标题

## 输出
- `openspec/changes/<feature-id>/proposal.md`（基于模板）
- `openspec/changes/<feature-id>/tasks.md`（基于模板）
- `openspec/changes/<feature-id>/runstate.md`（初始状态）
- `openspec/changes/<feature-id>/specs/`（空目录）

## 执行步骤
1. 验证 feature-id 格式（必须是 NNN-语义名称）
2. 检查是否已存在同名目录
3. 复制模板文件到新目录
4. 初始化 runstate 为 "proposed" 阶段
5. 提示用户填写 proposal.md

## 示例
输入: feature-id=002-logging-system
输出: 创建 openspec/changes/002-logging-system/ 及基础文件
```

### 4.3 各 Skill 详细定义

#### /feature-start

**功能**: 创建新 feature 目录并初始化基础文件

**输入**:
- feature-id: 三位序号+语义名称（如 `002-user-auth`）
- feature-title: feature 标题

**输出**:
- `openspec/changes/<feature-id>/proposal.md`
- `openspec/changes/<feature-id>/tasks.md`
- `openspec/changes/<feature-id>/runstate.md`
- `openspec/changes/<feature-id>/specs/`（空目录）

**执行步骤**:
1. 验证 feature-id 格式（NNN-语义名称）
2. 检查是否已存在同名目录
3. 复制模板文件到新目录
4. 初始化 runstate 为 "proposed" 阶段
5. 提示用户填写 proposal.md

---

#### /feature-spec

**功能**: 校验 proposal 并生成 specs 子目录

**输入**:
- feature-id: 已存在的 feature 目录

**输出**:
- `openspec/changes/<feature-id>/specs/<domain>/spec.md`
- 校验报告

**执行步骤**:
1. 读取 proposal.md，校验必需字段
2. 询问用户需要创建哪些 spec 子目录
3. 为每个子域创建 spec.md 模板
4. 提示用户填写 spec 内容

---

#### /feature-tasks

**功能**: 基于 proposal/spec 生成任务清单

**输入**:
- feature-id: 已存在的 feature 目录

**输出**:
- 更新后的 `tasks.md`

**执行步骤**:
1. 读取 proposal.md 和所有 spec.md
2. 生成任务列表，按依赖排序
3. 每个任务包含：目标、输入、输出、验证标准
4. 更新 runstate 为 "planned" 阶段

---

#### /feature-implement

**功能**: 加载固定输入包并按 tasks 执行

**输入**:
- feature-id: 已存在的 feature 目录

**输出**:
- 实现代码
- 更新后的 `runstate.md`

**执行步骤**:
1. 加载固定输入包：
   - AGENTS.md
   - PROJECT_RULES.md
   - openspec/project.md
   - 当前 feature 的 proposal/specs/tasks/runstate
2. 按 tasks.md 顺序逐个执行
3. 每完成一个任务，更新 runstate.md
4. 如遇阻塞，记录到 runstate 的 Blockers 字段

---

#### /feature-verify

**功能**: 执行测试并生成验证报告

**输入**:
- feature-id: 已实现的 feature

**输出**:
- 测试执行结果
- test-summary（简化版，写入 runstate）

**执行步骤**:
1. 执行项目测试命令
2. 检查覆盖率
3. 更新 runstate 为 "verifying" 阶段
4. 记录验证结果和已知缺口

---

#### /feature-close

**功能**: 收尾 feature，生成总结并更新知识索引

**输入**:
- feature-id: 已验证的 feature

**输出**:
- implementation-summary（简化版，写入 runstate）
- lessons-learned（简化版，写入 runstate）
- 更新后的 `knowledge-index.md`

**执行步骤**:
1. 生成实现总结
2. 提取可复用经验和模式
3. 同步到 knowledge-index.md
4. 更新 runstate 为 "completed" 阶段

---

#### /feature-archive

**功能**: 归档 feature

**输入**:
- feature-id: 已完成的 feature

**输出**:
- 移动目录到 `openspec/archive/<feature-id>/`
- 更新后的 `knowledge-index.md`

**执行步骤**:
1. 检查 feature 是否满足归档条件：
   - proposal 完整
   - tasks 全部关闭
   - runstate 已收尾
2. 移动目录到 archive
3. 更新 knowledge-index 添加归档记录

---

## 5. 模板设计

### 5.1 proposal.template.md

```markdown
# Feature Proposal

## 元信息
- Feature ID: {feature-id}
- 创建日期: {date}
- 状态: proposed

---

## 1. 背景
<!-- 描述为什么需要这个 feature -->

## 2. 问题陈述
<!-- 清晰描述要解决的问题 -->

## 3. 目标
<!-- 这个 feature 要达成什么 -->

## 4. 非目标
<!-- 明确不包含什么，防止范围蔓延 -->

## 5. 成功标准
<!-- 如何判断这个 feature 成功完成 -->

## 6. 影响范围
<!-- 涉及哪些模块/系统 -->

## 7. 风险
<!-- 可能遇到的问题和应对策略 -->
```

### 5.2 tasks.template.md

```markdown
# Feature Tasks

## 元信息
- Feature ID: {feature-id}
- 更新日期: {date}
- 状态: planned

---

## 任务列表

### Task 1: {task-title}
- **目标**: {goal}
- **输入**: {inputs}
- **输出**: {outputs}
- **验证**: {verification}
- **依赖**: {dependencies}
- **状态**: pending

### Task 2: {task-title}
...

---

## 任务依赖图
<!-- 可选：用文本或图表示任务依赖关系 -->
```

### 5.3 runstate.template.md

```markdown
# Feature Runstate

## 元信息
- Feature ID: {feature-id}
- 更新日期: {date}
- 当前阶段: proposed

---

## 当前状态

| 字段 | 值 |
|------|-----|
| 当前阶段 | proposed |
| 已完成 | - |
| 进行中 | - |
| 待处理 | proposal 待填写 |
| 阻塞点 | - |
| 下一步动作 | 填写 proposal.md |

---

## 重要文件
<!-- 记录本次 feature 关键文件路径 -->

---

## 最后验证时间
<!-- 记录上次验证的时间戳 -->
```

---

## 6. 交付物清单

第一阶段完成时，仓库应包含：

### 6.1 必须创建的文件

1. **根目录治理文件** (3个)
   - AGENTS.md
   - PROJECT_RULES.md
   - README.md（更新）

2. **OpenSpec 核心文件** (5个)
   - openspec/project.md
   - openspec/conventions.md
   - openspec/templates/proposal.template.md
   - openspec/templates/tasks.template.md
   - openspec/templates/runstate.template.md

3. **知识层文件** (1个)
   - docs/knowledge/knowledge-index.md

4. **Superpowers 规则文件** (2个)
   - .superpowers/context/execution-rules.md
   - .superpowers/checklists/implementation-checklist.md

5. **工作流文件** (1个)
   - docs/workflows/feature-lifecycle.md

6. **Skill 定义文件** (7个)
   - .superpowers/skills/feature-start.md
   - .superpowers/skills/feature-spec.md
   - .superpowers/skills/feature-tasks.md
   - .superpowers/skills/feature-implement.md
   - .superpowers/skills/feature-verify.md
   - .superpowers/skills/feature-close.md
   - .superpowers/skills/feature-archive.md

### 6.2 必须创建的目录

- openspec/changes/（空）
- openspec/archive/（空）
- docs/standards/（包含 coding-standards.md 占位）

---

## 7. 验收标准

第一阶段完成的验收条件：

1. ✅ 所有必须文件已创建且有实际内容（非空占位）
2. ✅ AGENTS.md 包含完整的项目入口信息
3. ✅ 7 个 skill 文件定义完整
4. ✅ 3 个模板文件包含必需字段
5. ✅ 可以创建一个示例 feature 并验证流程
6. ✅ README.md 包含治理框架使用说明

---

## 8. 实施顺序建议

```
Phase A: 目录与文件骨架
├─ 创建所有目录
├─ 创建 AGENTS.md
├─ 创建 PROJECT_RULES.md
└─ 更新 README.md

Phase B: OpenSpec 基础
├─ 创建 openspec/project.md
├─ 创建 openspec/conventions.md
└─ 创建 3 个模板文件

Phase C: Superpowers 规则
├─ 创建 .superpowers/context/execution-rules.md
└─ 创建 .superpowers/checklists/implementation-checklist.md

Phase D: Skill 命令定义
├─ 创建 7 个 skill 文件
└─ 验证 skill 格式正确

Phase E: 知识层与工作流
├─ 创建 knowledge-index.md
└─ 创建 feature-lifecycle.md

Phase F: 示例验证
├─ 创建示例 feature（如 001-governance-foundation）
└─ 验证完整流程可执行
```

---

## 9. 后续迭代规划

第一阶段完成后，后续可增强：

### 第二阶段
- 补充 design.template.md、implementation-summary.template.md 等
- 补充 docs/architecture/、docs/domain/
- 增加 spec gate / design gate 自动检查

### 第三阶段
- 多 agent 并行 task 执行
- 自动经验提炼
- 项目知识图谱化

---

## 10. 风险与缓解

| 风险 | 缓解措施 |
|------|----------|
| 文件过多难以维护 | 精简核心化，后续迭代补充 |
| skill 命令未正确加载 | 测试验证 skill 可被识别 |
| 模板内容不完整 | 定义必需字段，提供示例 |
| 目录命名不稳定 | 在 conventions.md 中固定命名规则 |

---

## 结论

本设计文档定义了治理骨架第一阶段的精简版本，核心原则：

1. **最小可用** - 只保留核心文件，确保能用
2. **入口清晰** - AGENTS.md 作为 AI 总入口
3. **命令可执行** - 7 个 skill 定义完整
4. **模板有内容** - 3 个模板包含必需字段
5. **流程可验证** - 示例 feature 验证完整流程