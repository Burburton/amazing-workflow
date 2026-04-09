#!/bin/bash
# feature-archive.sh - 归档已完成的 feature
# 用法: ./feature-archive.sh <feature-id>
# 参考: .superpowers/skills/feature-archive/SKILL.md

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查参数
if [ $# -lt 1 ]; then
    echo -e "${YELLOW}用法:${NC}"
    echo "  $0 <feature-id>"
    echo ""
    echo -e "${YELLOW}示例:${NC}"
    echo "  $0 005-user-auth"
    exit 1
fi

FEATURE_ID="$1"
DATE=$(date +%Y-%m-%d)
CHANGES_DIR="openspec/changes/${FEATURE_ID}"
ARCHIVE_DIR="openspec/archive/${FEATURE_ID}"

# 检查 feature 是否存在
if [ ! -d "$CHANGES_DIR" ]; then
    echo -e "${RED}错误: feature 目录不存在${NC}"
    echo "路径: $CHANGES_DIR"
    echo ""
    echo "当前活跃 features:"
    ls -1 openspec/changes/ 2>/dev/null || echo "  (无)"
    exit 1
fi

# 检查归档目录是否已存在
if [ -d "$ARCHIVE_DIR" ]; then
    echo -e "${RED}错误: 归档目录已存在${NC}"
    echo "路径: $ARCHIVE_DIR"
    exit 1
fi

# 检查 runstate.md 是否存在
RUNSTATE_FILE="${CHANGES_DIR}/runstate.md"
if [ ! -f "$RUNSTATE_FILE" ]; then
    echo -e "${YELLOW}警告: runstate.md 不存在${NC}"
fi

echo -e "${GREEN}归档 feature: ${FEATURE_ID}${NC}"
echo ""

# 创建归档目录（如果不存在）
mkdir -p openspec/archive

# 移动目录
echo "移动 ${CHANGES_DIR} -> ${ARCHIVE_DIR}"
mv "$CHANGES_DIR" "$ARCHIVE_DIR"

# 更新 runstate.md
RUNSTATE_FILE="${ARCHIVE_DIR}/runstate.md"
if [ -f "$RUNSTATE_FILE" ]; then
    echo "更新 runstate.md..."
    
    # 更新当前阶段为 archived
    if grep -q "当前阶段.*:" "$RUNSTATE_FILE"; then
        sed -i "s/当前阶段.*/当前阶段 | archived/" "$RUNSTATE_FILE" 2>/dev/null || \
        sed -i '' "s/当前阶段.*/当前阶段 | archived/" "$RUNSTATE_FILE"
    fi
    
    # 添加归档记录到变更历史
    if grep -q "## 变更历史" "$RUNSTATE_FILE"; then
        # 找到变更历史表格的最后一行，添加新行
        if grep -q "| 日期 | 阶段变更" "$RUNSTATE_FILE"; then
            # 在最后一个表格行后添加新行
            awk -v date="$DATE" -v id="$FEATURE_ID" '
            /^## / && !/^## 变更历史/ { in_table=0 }
            /^## 变更历史/ { in_table=1 }
            /^\| [0-9]{4}-[0-9]{2}-[0-9]{2} \|/ { last=$0 }
            /^## [^变]/ && in_table && last {
                print last
                print "| " date " | completed → archived | 移动到 openspec/archive/" id "/ |"
                last=""
                in_table=0
            }
            { print }
            END { if (last) print last }
            ' "$RUNSTATE_FILE" > "${RUNSTATE_FILE}.tmp" && mv "${RUNSTATE_FILE}.tmp" "$RUNSTATE_FILE"
        fi
    fi
fi

echo ""
echo -e "${GREEN}✓ Feature 归档成功!${NC}"
echo ""
echo "新路径: ${ARCHIVE_DIR}/"
echo ""
echo -e "${YELLOW}后续操作:${NC}"
echo "1. 更新 docs/knowledge/knowledge-index.md"
echo "2. 提交 git 变更"