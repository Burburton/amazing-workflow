#!/bin/bash
# feature-archive.sh - 归档已完成的 feature（增强版）
# 用法: ./feature-archive.sh <feature-id>
# 参考: .superpowers/skills/feature-archive/SKILL.md
# Spec: openspec/changes/007-auto-archive/specs/archive/spec.md

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查参数
if [ $# -lt 1 ]; then
    echo -e "${YELLOW}用法:${NC}"
    echo "  $0 <feature-id>"
    echo ""
    echo -e "${YELLOW}示例:${NC}"
    echo "  $0 007-auto-archive"
    echo ""
    echo -e "${YELLOW}当前活跃 features:${NC}"
    ls -1 openspec/changes/ 2>/dev/null || echo "  (无)"
    exit 1
fi

FEATURE_ID="$1"
DATE=$(date +%Y-%m-%d)
CHANGES_DIR="openspec/changes/${FEATURE_ID}"
ARCHIVE_DIR="openspec/archive/${FEATURE_ID}"

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}Feature 归档工具 (增强版)${NC}"
echo -e "${BLUE}======================================${NC}"
echo ""

# ========================================
# Step 1: 检查 feature 是否存在
# ========================================
echo -e "${GREEN}[Step 1] 检查 feature 目录...${NC}"

if [ ! -d "$CHANGES_DIR" ]; then
    echo -e "${RED}✗ 错误: feature 目录不存在${NC}"
    echo "路径: $CHANGES_DIR"
    echo ""
    echo -e "${YELLOW}当前活跃 features:${NC}"
    ls -1 openspec/changes/ 2>/dev/null || echo "  (无)"
    exit 1
fi

echo -e "${GREEN}✓ Feature 目录存在: ${CHANGES_DIR}${NC}"

# ========================================
# Step 2: 检查归档目录是否已存在
# ========================================
echo -e "${GREEN}[Step 2] 检查归档目录...${NC}"

if [ -d "$ARCHIVE_DIR" ]; then
    echo -e "${RED}✗ 错误: 归档目录已存在${NC}"
    echo "路径: $ARCHIVE_DIR"
    echo ""
    echo -e "${YELLOW}建议: 该 feature 已归档，无需重复操作${NC}"
    exit 1
fi

echo -e "${GREEN}✓ 归档目录不存在，可以继续${NC}"

# ========================================
# Step 3: 验证 feature 状态
# ========================================
echo -e "${GREEN}[Step 3] 验证 feature 状态...${NC}"

RUNSTATE_FILE="${CHANGES_DIR}/runstate.md"

if [ ! -f "$RUNSTATE_FILE" ]; then
    echo -e "${RED}✗ 错误: runstate.md 不存在${NC}"
    echo "路径: ${RUNSTATE_FILE}"
    echo ""
    echo -e "${YELLOW}建议: 请先创建 runstate.md 并完成 feature${NC}"
    exit 1
fi

CURRENT_STAGE=$(awk '/- \*\*当前阶段\*\*:/{gsub(/- \*\*当前阶段\*\*: /,""); gsub(/^[ \t]+|[ \t]+$/,""); print; exit}' "$RUNSTATE_FILE")

if [ -z "$CURRENT_STAGE" ]; then
    CURRENT_STAGE=$(awk '/^\| 当前阶段/{gsub(/^\| 当前阶段 \| /,""); gsub(/ \|$/,""); gsub(/^[ \t]+|[ \t]+$/,""); print; exit}' "$RUNSTATE_FILE")
fi

echo "当前阶段: ${CURRENT_STAGE}"

# 只允许 completed 或 verifying 状态归档
ALLOWED_STAGES="completed verifying"
if ! echo "$ALLOWED_STAGES" | grep -qw "$CURRENT_STAGE"; then
    echo -e "${RED}✗ 错误: 当前阶段为 '${CURRENT_STAGE}'，不允许归档${NC}"
    echo ""
    echo -e "${YELLOW}允许归档的阶段: completed, verifying${NC}"
    echo -e "${YELLOW}建议:${NC}"
    echo "  1. 完成 feature 实现和验证"
    echo "  2. 更新 runstate.md 状态为 completed"
    echo "  3. 再次执行归档"
    exit 1
fi

echo -e "${GREEN}✓ 状态验证通过: ${CURRENT_STAGE}${NC}"

# ========================================
# Step 4: 提取 feature 信息
# ========================================
echo -e "${GREEN}[Step 4] 提取 feature 信息...${NC}"

# 从 proposal.md 提取标题（用于 knowledge-index）
PROPOSAL_FILE="${CHANGES_DIR}/proposal.md"
FEATURE_TITLE=""

if [ -f "$PROPOSAL_FILE" ]; then
    # 尝试提取标题行或 Feature ID 行
    FEATURE_TITLE=$(grep -E "^# Feature Proposal" "$PROPOSAL_FILE" | head -1 || echo "")
    if [ -z "$FEATURE_TITLE" ]; then
        FEATURE_TITLE=$(grep -E "Feature ID.*:" "$PROPOSAL_FILE" | head -1 | sed 's/Feature ID.*: //' || echo "$FEATURE_ID")
    fi
fi

# 尝试从 proposal 提取主要贡献（用于 knowledge-index）
FEATURE_CONTRIBUTION=""
if [ -f "$PROPOSAL_FILE" ]; then
    # 提取目标部分的第一条
    FEATURE_CONTRIBUTION=$(grep -A3 "## 3. 目标" "$PROPOSAL_FILE" | grep "^-" | head -1 | sed 's/^- //' || echo "")
fi

# 如果没有提取到，使用默认值
if [ -z "$FEATURE_TITLE" ]; then
    FEATURE_TITLE="$FEATURE_ID"
fi
if [ -z "$FEATURE_CONTRIBUTION" ]; then
    FEATURE_CONTRIBUTION="归档脚本自动化"
fi

echo "Feature ID: ${FEATURE_ID}"
echo "Feature 名称: ${FEATURE_TITLE}"
echo "主要贡献: ${FEATURE_CONTRIBUTION}"

# ========================================
# Step 5: 移动目录
# ========================================
echo -e "${GREEN}[Step 5] 移动目录到 archive...${NC}"

mkdir -p openspec/archive
mv "$CHANGES_DIR" "$ARCHIVE_DIR"

echo -e "${GREEN}✓ 目录移动成功${NC}"
echo "新路径: ${ARCHIVE_DIR}/"

# ========================================
# Step 6: 更新 runstate.md
# ========================================
echo -e "${GREEN}[Step 6] 更新 runstate.md...${NC}"

RUNSTATE_FILE="${ARCHIVE_DIR}/runstate.md"

if [ -f "$RUNSTATE_FILE" ]; then
    # 跨平台兼容：检测 sed 版本
    if sed --version 2>/dev/null | grep -q "GNU"; then
        # GNU sed (Linux)
        SED_CMD="sed -i"
    else
        # BSD sed (macOS)
        SED_CMD="sed -i ''"
    fi
    
    # 更新元信息中的"当前阶段"
    $SED_CMD "s/- \*\*当前阶段\*\*: .*/- **当前阶段**: archived/" "$RUNSTATE_FILE" 2>/dev/null || \
    sed -i '' "s/- \*\*当前阶段\*\*: .*/- **当前阶段**: archived/" "$RUNSTATE_FILE"
    
    # 更新状态表格中的"当前阶段"
    # 使用 awk 更可靠
    awk -v stage="archived" '
    /^## 当前状态/ { in_status=1; print; next }
    in_status && /^\| 当前阶段/ { 
        gsub(/|[^|]*|$/, "| " stage " |")
        print
        in_status=0
        next
    }
    { print }
    ' "$RUNSTATE_FILE" > "${RUNSTATE_FILE}.tmp" && mv "${RUNSTATE_FILE}.tmp" "$RUNSTATE_FILE"
    
    # 更新状态表格中的"待处理"和"下一步动作"
    awk '
    /^## 当前状态/ { in_status=1; print; next }
    in_status && /^\| 待处理/ { 
        gsub(/|[^|]*|$/, "| - |")
        print
        next
    }
    in_status && /^\| 下一步动作/ { 
        gsub(/|[^|]*|$/, "| - |")
        print
        in_status=0
        next
    }
    { print }
    ' "$RUNSTATE_FILE" > "${RUNSTATE_FILE}.tmp" && mv "${RUNSTATE_FILE}.tmp" "$RUNSTATE_FILE"
    
    # 添加变更历史记录
    awk -v date="$DATE" -v id="$FEATURE_ID" '
    /^## 变更历史/ { in_history=1; print; next }
    in_history && /^## [^变]/ { 
        # 在下一个章节前添加新记录
        print "| " date " | completed → archived | 移动到 openspec/archive/" id "/ |"
        in_history=0
    }
    in_history && /^\| [0-9]{4}-[0-9]{2}-[0-9]{2}/ { last=$0; print; next }
    { print }
    END { 
        if (in_history && last) {
            print "| " date " | completed → archived | 移动到 openspec/archive/" id "/ |"
        }
    }
    ' "$RUNSTATE_FILE" > "${RUNSTATE_FILE}.tmp" && mv "${RUNSTATE_FILE}.tmp" "$RUNSTATE_FILE"
    
    echo -e "${GREEN}✓ runstate.md 更新成功 (状态: archived)${NC}"
else
    echo -e "${YELLOW}⚠ runstate.md 不存在，跳过更新${NC}"
fi

# ========================================
# Step 7: 更新 knowledge-index.md
# ========================================
echo -e "${GREEN}[Step 7] 更新 knowledge-index.md...${NC}"

KNOWLEDGE_INDEX="docs/knowledge/knowledge-index.md"

if [ -f "$KNOWLEDGE_INDEX" ]; then
    # 在 Feature 索引表格添加新行
    # 格式: | {feature-id} | {name} | archived | {date} | {主要贡献} |
    
    # 找到最后一个 archived feature 行的位置
    awk -v id="$FEATURE_ID" -v title="$FEATURE_TITLE" -v date="$DATE" -v contribution="$FEATURE_CONTRIBUTION" '
    /^## Feature 索引/ { in_index=1; print; next }
    in_index && /^## [^F]/ { 
        # 在下一个章节前插入新行
        print "| " id " | " title " | archived | " date " | " contribution " |"
        in_index=0
    }
    in_index && /^\| 00[0-9]-/ { print }
    /^---$/ && !in_index { print }
    { print }
    ' "$KNOWLEDGE_INDEX" > "${KNOWLEDGE_INDEX}.tmp" && mv "${KNOWLEDGE_INDEX}.tmp" "$KNOWLEDGE_INDEX"
    
    # 同时更新更新记录表格
    awk -v date="$DATE" -v id="$FEATURE_ID" '
    /^## 更新记录/ { in_update=1; print; next }
    in_update && /^## [^更]/ { 
        print "| " date " | " id " | 归档完成，状态更新为 archived |"
        in_update=0
    }
    in_update && /^\| [0-9]{4}-[0-9]{2}-[0-9]{2}/ { print }
    { print }
    ' "$KNOWLEDGE_INDEX" > "${KNOWLEDGE_INDEX}.tmp" && mv "${KNOWLEDGE_INDEX}.tmp" "$KNOWLEDGE_INDEX"
    
    echo -e "${GREEN}✓ knowledge-index.md 更新成功${NC}"
else
    echo -e "${YELLOW}⚠ knowledge-index.md 不存在${NC}"
    echo -e "${YELLOW}建议: 手动添加 feature 记录到 docs/knowledge/knowledge-index.md${NC}"
fi

# ========================================
# Step 8: Git 提交
# ========================================
echo -e "${GREEN}[Step 8] Git 提交...${NC}"

# 检查是否在 git 仓库中
if git rev-parse --is-inside-work-tree 2>/dev/null; then
    # 添加所有变更
    git add -A
    
    # 提交
    COMMIT_MSG="archive(${FEATURE_ID}): complete feature lifecycle"
    git commit -m "$COMMIT_MSG"
    
    echo -e "${GREEN}✓ Git commit 成功${NC}"
    echo "Commit message: ${COMMIT_MSG}"
    
    # 询问是否 push
    echo ""
    echo -e "${YELLOW}是否 push 到远程仓库?${NC}"
    echo "  输入 'y' 执行 push，其他输入跳过"
    read -t 10 -n 1 PUSH_CONFIRM || PUSH_CONFIRM="n"
    echo ""
    
    if [ "$PUSH_CONFIRM" = "y" ] || [ "$PUSH_CONFIRM" = "Y" ]; then
        git push
        echo -e "${GREEN}✓ Push 成功${NC}"
    else
        echo -e "${YELLOW}已跳过 push，可手动执行: git push${NC}"
    fi
else
    echo -e "${YELLOW}⚠ 当前目录不在 git 仓库中，跳过 git 操作${NC}"
fi

# ========================================
# 完成
# ========================================
echo ""
echo -e "${GREEN}======================================${NC}"
echo -e "${GREEN}✓ Feature 归档完成!${NC}"
echo -e "${GREEN}======================================${NC}"
echo ""
echo "归档路径: ${ARCHIVE_DIR}/"
echo "状态: archived"
echo "日期: ${DATE}"
echo ""
echo -e "${BLUE}后续操作:${NC}"
echo "  - 可在 openspec/archive/${FEATURE_ID}/ 查看归档内容"
echo "  - docs/knowledge/knowledge-index.md 已更新"
echo ""