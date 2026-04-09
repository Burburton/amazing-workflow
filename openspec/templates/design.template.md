# Feature Design

## 元信息

- **Feature ID**: {feature-id}
- **创建日期**: {date}
- **状态**: draft
- **作者**: {author}

---

## 1. Context

<!-- 描述当前系统状态，为什么需要这个设计 -->

### 1.1 当前问题
<!-- 现有系统的痛点或限制 -->

### 1.2 相关背景
<!-- 相关的技术背景、业务背景 -->

---

## 2. Proposed Architecture

<!-- 描述整体架构方案，可以用图示 -->

### 2.1 架构图
```
+-------------------+     +-------------------+
|     Component A   |---->|     Component B   |
+-------------------+     +-------------------+
```

### 2.2 核心概念
<!-- 解释核心概念和术语 -->

---

## 3. Module Changes

<!-- 描述涉及的模块变更 -->

### 3.1 新增模块
- `module-a`: 描述职责

### 3.2 修改模块
- `module-b`: 描述变更

### 3.3 删除模块
- `module-c`: 描述原因

---

## 4. Data Flow

<!-- 描述数据流转过程 -->

```
输入 → 处理A → 处理B → 输出
```

---

## 5. API / Interface Changes

### 5.1 新增 API
```
POST /api/resource
Request: { ... }
Response: { ... }
```

### 5.2 修改 API
```
原: GET /api/old
新: GET /api/new
```

### 5.3 废弃 API
```
DELETE /api/deprecated (use /api/new instead)
```

---

## 6. Trade-offs

| 方案 | 优点 | 缺点 |
|------|------|------|
| 方案 A | ... | ... |
| 方案 B | ... | ... |

**选择**: 方案 A，原因：...

---

## 7. Risks and Mitigations

| 风险 | 影响 | 概率 | 缓解措施 |
|------|------|------|----------|
| 风险1 | 高/中/低 | 高/中/低 | ... |

---

## 8. Open Questions

- [ ] 问题 1: ...
- [ ] 问题 2: ...

---

## 9. Alternatives Considered

### 方案 A: ...
<!-- 描述及不选择的原因 -->

### 方案 B: ...
<!-- 描述及不选择的原因 -->

---

## 审批

- [ ] Design 已评审
- [ ] 可进入 tasks 阶段