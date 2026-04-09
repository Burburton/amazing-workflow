#!/bin/bash
# feature-start.sh - 创建新的 feature 目录并初始化基础文件
# 用法: ./feature-start.sh <feature-id> "<feature-title>"
# 参考: .superpowers/skills/feature-start/SKILL.md

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查参数
if [ $# -lt 2 ]; then
    echo -e "${YELLOW}用法:${NC}"
    echo "  $0 <feature-id> \"<feature-title>\""
    echo ""
    echo -e "${YELLOW}示例:${NC}"
    echo "  $0 005-user-auth \"用户认证功能\""
    exit 1
fi

FEATURE_ID="$1"
FEATURE_TITLE="$2"
DATE=$(date +%Y-%m-%d)
FEATURE_DIR="openspec/changes/${FEATURE_ID}"

# 验证 feature-id 格式 (NNN-semantic-name)
if ! [[ "$FEATURE_ID" =~ ^[0-9]{3}-[a-z0-9-]+$ ]]; then
    echo -e "${RED}错误: feature-id 格式不正确${NC}"
    echo "期望格式: NNN-semantic-name (如 005-user-auth)"
    exit 1
fi

# 检查是否已存在
if [ -d "$FEATURE_DIR" ]; then
    echo -e "${RED}错误: feature 目录已存在${NC}"
    echo "路径: $FEATURE_DIR"
    echo "请选择不同的 feature-id 或先归档现有 feature"
    exit 1
fi

# 检查模板目录
if [ ! -d "openspec/templates" ]; then
    echo -e "${RED}错误: 模板目录不存在${NC}"
    echo "请确保在项目根目录执行此脚本"
    exit 1
fi

echo -e "${GREEN}创建 feature: ${FEATURE_ID}${NC}"
echo "标题: ${FEATURE_TITLE}"
echo ""

# 创建目录结构
echo "1. 创建目录结构..."
mkdir -p "${FEATURE_DIR}/specs"

# 复制并处理模板文件
echo "2. 生成基础文件..."

# proposal.md
sed -e "s/{feature-id}/${FEATURE_ID}/g" \
    -e "s/{date}/${DATE}/g" \
    -e "s/{author}/AI + User/g" \
    openspec/templates/proposal.template.md > "${FEATURE_DIR}/proposal.md"

# tasks.md
sed -e "s/{feature-id}/${FEATURE_ID}/g" \
    -e "s/{date}/${DATE}/g" \
    openspec/templates/tasks.template.md > "${FEATURE_DIR}/tasks.md"

# runstate.md
sed -e "s/{feature-id}/${FEATURE_ID}/g" \
    -e "s/{date}/${DATE}/g" \
    -e "s/{agent-or-user}/AI/g" \
    openspec/templates/runstate.template.md > "${FEATURE_DIR}/runstate.md"

echo ""
echo -e "${GREEN}✓ Feature 创建成功!${NC}"
echo ""
echo "目录: ${FEATURE_DIR}/"
echo "文件:"
echo "  - proposal.md"
echo "  - tasks.md"
echo "  - runstate.md"
echo "  - specs/ (空目录)"
echo ""
echo -e "${YELLOW}下一步:${NC}"
echo "1. 编辑 proposal.md 填写背景、目标、成功标准"
echo "2. 执行 feature-spec 生成 spec.md"
echo "3. 执行 feature-tasks 生成任务列表"