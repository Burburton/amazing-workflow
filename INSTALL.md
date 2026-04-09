# 安装 Amazing Workflow Skills Plugin

## 步骤 1：添加 Plugin 到全局配置

编辑 `C:/Users/Monster/.config/opencode/opencode.json`，在 `plugin` 数组中添加：

```json
{
  "plugin": [
    "opencode-mem",
    "oh-my-opencode",
    "superpowers@git+https://github.com/obra/superpowers.git",
    "G:/Workspace/amazing-workflow"
  ]
}
```

## 步骤 2：重启 OpenCode

关闭当前 OpenCode 会话，重新启动。

## 步骤 3：验证 Skills

在 OpenCode 中运行：

```
skill
```

应该能看到以下 skills：
- `feature-start`
- `feature-spec`
- `feature-tasks`
- `feature-implement`
- `feature-verify`
- `feature-close`
- `feature-archive`

## 使用方式

```
使用 feature-start 创建新 feature
```

或

```
skill feature-start
```