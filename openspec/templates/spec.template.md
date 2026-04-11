# Spec Template

> **使用说明**: 本模板定义 feature 的需求和验收标准。填写时确保 Overview 清晰、Requirements 具体可验证、Acceptance Scenarios 使用 Given/When/Then 格式。Out of Scope 必须明确列出防止范围蔓延。

## 元信息

- **Feature ID**: {feature-id}
- **创建日期**: {date}
- **状态**: specified
- **领域**: {domain}

---

## 1. Overview

<!-- 一段话描述本 feature 的核心目标和背景。回答"这个 feature 要解决什么问题" -->

---

## 2. Requirements

### 2.1 Functional Requirements

<!-- 功能需求：系统必须具备的能力 -->

#### FR-1: {requirement-title}

<!-- 需求描述 -->

**验证标准**: <!-- 如何验证这个需求是否满足 -->

#### FR-2: {requirement-title}

<!-- 需求描述 -->

**验证标准**: <!-- 如何验证这个需求是否满足 -->

### 2.2 Non-Functional Requirements

<!-- 非功能需求：性能、安全、可维护性等 -->

#### NFR-1: {requirement-title}

<!-- 需求描述 -->

**验证标准**: <!-- 如何验证这个需求是否满足 -->

---

## 3. Boundary Conditions

<!-- 边界条件：必须明确说明的约束和限制 -->

1. **边界 1**: <!-- 描述 -->
2. **边界 2**: <!-- 描述 -->

---

## 4. Acceptance Scenarios

<!-- 验收场景：使用 Given/When/Then 格式 -->

### AS-1: {scenario-title}

**Given** <!-- 前置条件 -->
**When** <!-- 触发动作 -->
**Then** <!-- 期望结果 -->
**And** <!-- 附加结果 -->

### AS-2: {scenario-title}

**Given** <!-- 前置条件 -->
**When** <!-- 触发动作 -->
**Then** <!-- 期望结果 -->
**And** <!-- 附加结果 -->

### AS-3: {scenario-title}

**Given** <!-- 前置条件 -->
**When** <!-- 触发动作 -->
**Then** <!-- 期望结果 -->
**And** <!-- 附加结果 -->

---

## 5. Edge Cases

<!-- 边界情况：需要特别处理的异常场景 -->

1. **边界情况 1**: <!-- 描述及处理方式 -->
2. **边界情况 2**: <!-- 描述及处理方式 -->

---

## 6. Constraints

<!-- 约束条件：必须遵守的限制 -->

- 约束 1: <!-- 描述 -->
- 约束 2: <!-- 描述 -->

---

## 7. Out of Scope

<!-- 明确不包含的内容，防止范围蔓延 -->

- ❌ 不做: <!-- 描述 -->
- ❌ 不做: <!-- 描述 -->
- ❌ 不做: <!-- 描述 -->

---

## 填写示例

```
## 1. Overview

本 feature 实现用户登录功能，支持 JWT token 认证，目标是为 API 提供安全的身份验证机制。

## 2. Requirements

### FR-1: 用户登录
用户必须能通过用户名和密码登录，成功后返回 JWT token。
**验证标准**: 能用正确凭证登录并获得有效 token。

### NFR-1: 安全性
密码必须加密存储，token 有效期不超过 24 小时。
**验证标准**: 数据库中无明文密码，token 过期后自动失效。

## 7. Out of Scope

- ❌ 不做: OAuth 第三方登录
- ❌ 不做: 密码找回功能
```

---

## 审批

- [ ] Spec 已评审
- [ ] Requirements 边界条件明确
- [ ] Out of Scope 已列出
- [ ] 可进入 tasks 阶段