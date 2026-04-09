#!/bin/bash
# feature-status.sh - 显示所有 feature 的当前状态
# 用法: ./feature-status.sh

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 获取 feature 状态
get_feature_status() {
    local feature_dir="$1"
    local runstate_file="${feature_dir}/runstate.md"
    
    if [ -f "$runstate_file" ]; then
        # 提取当前阶段
        grep -oP '(?<=当前阶段 \| )[a-z]+' "$runstate_file" 2>/dev/null || \
        grep "当前阶段" "$runstate_file" | grep -oE '(proposed|specified|planned|implementing|verifying|completed|archived)' | head -1
    else
        echo "unknown"
    fi
}

echo -e "${BLUE}=== Feature 状态 ===${NC}"
echo ""

# 活跃 features
CHANGES_DIR="openspec/changes"
if [ -d "$CHANGES_DIR" ] && [ "$(ls -A $CHANGES_DIR 2>/dev/null)" ]; then
    echo -e "${GREEN}活跃 Features:${NC}"
    for dir in "$CHANGES_DIR"/*/; do
        if [ -d "$dir" ]; then
            feature_name=$(basename "$dir")
            status=$(get_feature_status "$dir")
            printf "  %-35s %s\n" "$feature_name" "$status"
        fi
    done
else
    echo -e "${YELLOW}活跃 Features:${NC} (无)"
fi

echo ""

# 已归档 features
ARCHIVE_DIR="openspec/archive"
if [ -d "$ARCHIVE_DIR" ] && [ "$(ls -A $ARCHIVE_DIR 2>/dev/null)" ]; then
    echo -e "${BLUE}已归档 Features:${NC}"
    for dir in "$ARCHIVE_DIR"/*/; do
        if [ -d "$dir" ]; then
            feature_name=$(basename "$dir")
            status=$(get_feature_status "$dir")
            printf "  %-35s %s\n" "$feature_name" "$status"
        fi
    done
else
    echo -e "${BLUE}已归档 Features:${NC} (无)"
fi

echo ""

# 统计
active_count=$(find "$CHANGES_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
archived_count=$(find "$ARCHIVE_DIR" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)

echo -e "${BLUE}统计:${NC}"
echo "  活跃: $active_count"
echo "  已归档: $archived_count"
echo "  总计: $((active_count + archived_count))"