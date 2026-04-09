# Skill 执行指南

本指南说明如何执行项目自定义的 feature skill 命令。

---

## 1. 问题背景

OpenCode 的 `skill` 工具目前只支持内置 skill，无法直接调用项目自定义的 skill（如 `/feature-start`、`/feature-spec` 等）。

**解决方式**：
1. **手动执行** - 读取 SKILL.md 文件，按步骤执行
2. **脚本执行** - 使用辅助脚本快速执行

---

## 2. 可用 Skill 列表

| Skill | 功能 | 脚本 |
|-------|------|------|
| `/feature-start` | 创建新 feature | `feature-start.sh` |
| `/feature-spec` | 生成 spec | 手动执行 |
| `/feature-tasks` | 生成 tasks | 手动执行 |
| `/feature-implement` | 执行实现 | 手动执行 |
| `/feature-verify` | 验证 feature | 手动执行 |
| `/feature-close` | 收尾 feature | 手动执行 |
| `/feature-archive` | 归档 feature | `feature-archive.sh` |
| `/feature-status` | 查询状态 | `feature-status.sh` |

---

## 3. 手动执行方式

### 3.1 步骤

1. **读取 SKILL.md**
   ```
   读取 .superpowers/skills/<skill-name>/SKILL.md
   ```

2. **理解输入/输出**
   - 查看"输入"部分了解需要的参数
   - 查看"输出"部分了解会生成什么文件

3. **按步骤执行**
   - 按照"执行步骤"部分的顺序操作
   - 每完成一步，验证结果

4. **更新 runstate.md**
   - 记录阶段变更
   - 更新任务状态

### 3.2 示例：手动执行 feature-start

**输入**：
- `feature-id`: 005-new-feature
- `feature-title`: 新功能

**执行步骤**：
```bash
# 1. 验证 feature-id 格式（NNN-semantic-name）
# 2. 检查目录是否存在
ls openspec/changes/005-new-feature 2>/dev/null && echo "已存在" || echo "可创建"

# 3. 创建目录
mkdir -p openspec/changes/005-new-feature/specs

# 4. 复制模板
cp openspec/templates/proposal.template.md openspec/changes/005-new-feature/proposal.md
cp openspec/templates/tasks.template.md openspec/changes/005-new-feature/tasks.md
cp openspec/templates/runstate.template.md openspec/changes/005-new-feature/runstate.md

# 5. 替换变量
# 在文件中将 {feature-id} 替换为 005-new-feature
# 将 {date} 替换为当前日期
```

---

## 4. 快捷执行方式

### 4.1 npm scripts（推荐）

在项目根目录创建 `package.json` 后，可使用：

```bash
# 创建 feature
npm run feature:start -- 005-new-feature "新功能"

# 查询状态
npm run feature:status

# 归档 feature
npm run feature:archive -- 005-new-feature

# 帮助
npm run feature:help
```

### 4.2 Shell 别名

在 shell 中加载别名：

```bash
# 一次性加载
source .superpowers/aliases.sh

# 或添加到 ~/.bashrc / ~/.zshrc
echo 'source /path/to/amazing-workflow/.superpowers/aliases.sh' >> ~/.bashrc
```

加载后可直接使用：

```bash
feature-start 005-new-feature "新功能"
feature-status
feature-archive 005-new-feature
```

---

## 5. 脚本执行方式（详细）

### 4.1 前提条件

- 位于项目根目录
- 有执行权限 (`chmod +x .superpowers/scripts/*.sh`)

### 4.2 feature-start.sh

**用途**：创建新的 feature 目录和基础文件

**用法**：
```bash
./.superpowers/scripts/feature-start.sh <feature-id> "<feature-title>"
```

**示例**：
```bash
./.superpowers/scripts/feature-start.sh 005-user-auth "用户认证功能"
```

**输出**：
- 创建 `openspec/changes/005-user-auth/` 目录
- 生成 `proposal.md`, `tasks.md`, `runstate.md`
- 创建 `specs/` 空目录

---

### 4.3 feature-archive.sh

**用途**：将完成的 feature 移动到归档目录

**用法**：
```bash
./.superpowers/scripts/feature-archive.sh <feature-id>
```

**示例**：
```bash
./.superpowers/scripts/feature-archive.sh 005-user-auth
```

**输出**：
- 移动 `openspec/changes/005-user-auth/` 到 `openspec/archive/005-user-auth/`
- 更新 runstate.md 状态为 archived

---

### 4.4 feature-status.sh

**用途**：显示所有 feature 的当前状态

**用法**：
```bash
./.superpowers/scripts/feature-status.sh
```

**输出**：
```
Active Features:
  005-user-auth: implementing

Archived Features:
  001-governance-foundation: archived
  002-workflow-dogfooding: archived
  003-feature-hardening: archived
```

---

## 5. AI 执行建议

### 5.1 选择执行方式

| 场景 | 推荐方式 |
|------|----------|
| 创建/归档 feature | 脚本执行 |
| spec/tasks/implement 阶段 | 手动执行 |
| 查询状态 | 脚本执行 |

### 5.2 执行检查清单

- [ ] 确认当前在项目根目录
- [ ] 确认 feature-id 格式正确
- [ ] 执行后验证文件已创建/移动
- [ ] 更新 runstate.md 记录状态变更

---

## 6. 故障排除

### 问题：脚本没有执行权限

**解决**：
```bash
chmod +x .superpowers/scripts/*.sh
```

### 问题：feature-id 已存在

**解决**：选择不同的 feature-id 或先归档现有 feature

### 问题：目录结构不正确

**解决**：确保在项目根目录执行脚本

---

## 更新记录

| 日期 | 更新内容 |
|------|----------|
| 2026-04-10 | 初始版本 |