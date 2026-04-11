# New Project Template

> 使用说明: 本模板定义新项目的初始化结构。创建新项目时，复制此结构并根据项目特点调整。

---

## 目录结构模板

```
<project-name>/
├─ AGENTS.md              # AI 项目入口（必须）
├─ PROJECT_RULES.md       # 项目硬规则（必须）
├─ README.md              # 用户入口（推荐）
│
├─ openspec/
│  ├─ project.md          # 项目级目标与范围
│  ├─ conventions.md      # OpenSpec 约定规则（可选）
│  ├─ templates/          # feature 模板目录
│  │  ├─ proposal.template.md
│  │  ├─ spec.template.md
│  │  ├─ tasks.template.md
│  │  └─ runstate.template.md
│  ├─ changes/            # 活跃 feature 目录
│  └─ archive/            # 已归档 feature 目录
│
├─ docs/
│  ├─ workflows/          # 工作流定义（可选）
│  ├─ knowledge/          # 知识沉淀
│  │  ├─ knowledge-index.md
│  │  ├─ reusable-patterns.md
│  │  └─ decision-history.md
│  └ standards/          # 工程规范（可选）
│
└─ .superpowers/          # Superpowers 配置（可选）
   ├─ context/            # 执行规则
   ├─ checklists/         # 检查清单
   └─ skills/             # skill 命令定义
```

---

## 必需文件

| 文件 | 用途 | 内容要点 |
|------|------|----------|
| `AGENTS.md` | AI 入口 | 项目概述、目录结构、feature 生命周期、工作规则 |
| `PROJECT_RULES.md` | 硬规则 | OpenSpec 规则、执行规则、技术栈规范、归档规则 |
| `openspec/project.md` | 项目目标 | 名称、目标、用户、原则、技术栈、阶段 |

---

## 初始化步骤

### Step 1: 创建目录

```bash
mkdir -p openspec/templates openspec/changes openspec/archive
mkdir -p openspec/changes/001-first-feature/specs
mkdir -p docs/knowledge docs/workflows
mkdir -p .superpowers/skills
```

### Step 2: 复制模板

```bash
# 从 amazing-workflow 复制模板文件
cp <amazing-workflow-path>/openspec/templates/*.md openspec/templates/
```

### Step 3: 创建项目入口

```bash
# 创建 AGENTS.md（参考模板）
touch AGENTS.md

# 创建 PROJECT_RULES.md（根据技术栈调整）
touch PROJECT_RULES.md

# 创建 project.md
touch openspec/project.md
```

### Step 4: 创建知识目录

```bash
# 创建知识索引文件
touch docs/knowledge/knowledge-index.md
touch docs/knowledge/reusable-patterns.md
touch docs/knowledge/decision-history.md
```

### Step 5: 初始化 git

```bash
git init
git add -A
git commit -m "init: project setup with OpenSpec governance framework"
```

---

## AGENTS.md 最小模板

```markdown
# AGENTS.md - AI 项目入口

## 1. 项目概述

**项目名称**: <name>
**项目目标**: <goal>
**技术栈**: <tech>
**当前阶段**: 初始化

## 2. 目录结构

<描述目录结构>

## 3. Feature 生命周期

idea → proposed → specified → planned → implementing → verifying → completed → archived

## 4. 工作规则

- 规格先行：不跳过 proposal/spec/tasks 直接编码
- 状态维护：每个阶段必须更新 runstate.md
- 知识沉淀：feature 完成后同步到 knowledge-index.md

## 5. 必读文件

1. AGENTS.md
2. PROJECT_RULES.md
3. openspec/project.md
```

---

## PROJECT_RULES.md 最小模板

```markdown
# PROJECT_RULES.md - 项目硬规则

## 1. OpenSpec 规则

- 禁止跳过 proposal/spec/tasks 直接编码
- Feature 编号格式: NNN-semantic-name

## 2. <技术栈> 代码规范

<根据技术栈填写>

## 3. 归档规则

- proposal 完整
- spec 完整
- tasks 全部关闭
- knowledge-index 已更新
```

---

## knowledge-index.md 最小模板

```markdown
# Knowledge Index

项目知识沉淀索引。

## Feature 索引

| Feature ID | 名称 | 状态 | 完成日期 | 主要贡献 |
|------------|------|------|----------|----------|
| （待添加） | | | | |

## 更新记录

| 日期 | Feature | 更新内容 |
|------|---------|----------|
| YYYY-MM-DD | 项目初始化 | 创建知识索引 |
```

---

## 完整示例

参考 md-meta-extractor 项目（Go CLI）作为完整示例：

```
md-meta-extractor/
├─ AGENTS.md              # Go CLI 项目入口
├─ PROJECT_RULES.md       # 含 Go 代码规范
├─ README.md              # 用户入口
├─ go.mod                 # Go 模块定义
│
├─ openspec/
│  ├─ project.md          # Markdown 元数据提取目标
│  ├─ templates/          # 4 个模板文件
│  ├─ changes/            # 001-core-extraction
│  └─ archive/            # （待归档）
│
├─ docs/
│  └─ knowledge/          # 知识沉淀
│
├─ cmd/                   # Go CLI 入口
├─ pkg/                   # Go 核心包
│
└─ .git/
```

---

## 注意事项

1. **保持结构一致** - 不要随意改动目录命名
2. **根据技术栈调整** - PROJECT_RULES.md 需包含技术栈规范
3. **第一个 feature** - 创建 001-<feature> 开始开发
4. **知识沉淀** - 每个 feature 完成后更新知识索引

---