# Superpowers Execution Rules

本文档定义 Superpowers 在本项目中的执行规则。

---

## 1. 固定输入包

每次实现开始前，必须加载以下文件：

### 必须加载
1. `AGENTS.md` - 项目入口
2. `PROJECT_RULES.md` - 项目规则
3. `openspec/project.md` - 项目目标
4. 当前 feature 的:
   - `proposal.md`
   - `tasks.md`
   - `runstate.md`
   - `specs/*/spec.md`（如存在）

### 推荐加载
- `docs/workflows/feature-lifecycle.md`
- `docs/knowledge/knowledge-index.md`

---

## 2. 执行边界

### 允许
- 按 tasks.md 顺序执行
- 在 spec 范围内做技术决策
- 更新 runstate.md
- 更新知识层

### 禁止
- 跳过 spec 直接实现
- 擅自改 feature 目标
- 擅自删除 spec 要求
- 不更新 runstate 就继续

---

## 3. 状态更新规则

### 每完成一个任务
1. 更新 `tasks.md` 中任务状态
2. 更新 `runstate.md` 当前状态
3. 如遇阻塞，记录到 `Blockers` 字段

### 每完成一个阶段
1. 更新 `runstate.md` 当前阶段
2. 记录变更历史

---

## 4. 异常处理

### Spec 不完整
```
停止 → 更新 spec → 获得确认 → 继续
```

### Design 不成立
```
记录问题 → 提出方案 → 更新 design → 获得确认
```

### 任务拆分不合理
```
更新 tasks.md → 更新 runstate → 继续
```

---

## 5. 提交规范

### 提交信息格式
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

### 类型
- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `refactor`: 重构
- `test`: 测试
- `chore`: 其他

---

## 6. 验证规则

### 实现阶段结束前
- [ ] 代码可编译/运行
- [ ] 测试通过
- [ ] runstate 已更新

### 收尾阶段
- [ ] implementation-summary 完成
- [ ] lessons-learned 完成
- [ ] knowledge-index 已更新