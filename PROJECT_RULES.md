# PROJECT_RULES.md - 项目硬规则

本文档定义项目的强制性规则，所有 AI 执行者和人类开发者必须遵守。

---

## 1. OpenSpec 规则

### 1.1 规格先行
- **禁止跳过 proposal/spec/tasks 直接编码**
- 所有功能变更必须先在 `openspec/changes/<feature>/` 下定义规格

### 1.2 Feature 编号规范
- 格式: `NNN-semantic-name`
- 示例: `001-governance-foundation`, `002-user-auth`
- 序号必须连续，不得跳号

### 1.3 Spec 写法要求
- 必须包含: Overview, Requirements, Acceptance Scenarios
- 边界条件必须明确
- Out of Scope 必须列出

---

## 2. 执行规则

### 2.1 状态维护
- 每个阶段必须更新 `runstate.md`
- 阻塞点必须记录在 `Blockers` 字段

### 2.2 知识沉淀
- feature 完成后必须更新 `knowledge-index.md`
- 可复用模式必须记录到 `docs/knowledge/reusable-patterns.md`

### 2.3 提交规范
- 提交信息格式: `feat(<feature>): <description>`
- 示例: `feat(auth): add JWT token validation`

---

## 3. 测试规则

### 3.1 测试覆盖
- 所有新功能必须有测试
- Bug 修复必须有回归测试

### 3.2 验证要求
- `runstate.md` 必须记录最后验证时间
- 验证结果必须记录在 runstate 或 test-summary

---

## 4. 归档规则

### 4.1 归档条件
feature 满足以下条件才能归档:
- [ ] proposal 完整
- [ ] spec 完整
- [ ] tasks 全部关闭或标明 deferred
- [ ] runstate 已收尾
- [ ] implementation-summary 已完成
- [ ] lessons-learned 已完成
- [ ] knowledge-index 已更新

### 4.2 禁止事项
- 禁止删除 archive 目录下的任何文件
- 禁止修改已归档 feature 的 spec

---

## 5. 目录规则

### 5.1 目录稳定性
- 目录结构不得随意改动
- 新增目录需在 `openspec/conventions.md` 中记录

### 5.2 文件命名
- 使用小写字母和连字符
- 模板文件: `*.template.md`
- 运行状态: `runstate.md`

---

## 6. AI 执行边界

### 6.1 允许
- 按照 feature spec 执行任务
- 更新 runstate 和知识层
- 在 spec 范围内做技术决策

### 6.2 禁止
- 擅自改 feature 目标
- 擅自改变验收边界
- 擅自删除 spec 要求
- 在 spec 不完整时开始实现

---

## 7. 异常处理

### 7.1 Spec 不完整
发现 spec 不完整时:
1. 停止实现
2. 更新 spec
3. 获得用户确认
4. 继续实现

### 7.2 Design 不成立
发现 design 不成立时:
1. 记录问题到 runstate.Blockers
2. 提出替代方案
3. 更新 design.md
4. 获得用户确认

### 7.3 任务拆分不合理
发现任务拆分不合理时:
1. 更新 tasks.md
2. 更新 runstate
3. 继续