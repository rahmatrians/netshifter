#!/bin/bash

# Colors
RESET="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
BOLD="\033[1m"

PROMOTE="$1"

if [ -z "$PROMOTE" ]; then
    echo -e "${YELLOW}⚡ Usage:${RESET} $0 <ServiceName>"
    echo -e "${CYAN}👉 Example:${RESET} $0 \"Wi-Fi\""
    exit 1
fi

# Extract exact service names from numbered lines
CURRENT_ORDER=()
while IFS= read -r line; do
  service=$(echo "$line" | sed -E 's/^\([0-9]+\) (.+)$/\1/')
  CURRENT_ORDER+=("$service")
done < <(networksetup -listnetworkserviceorder | grep -E '^\([0-9]+\) ')

# Check if PROMOTE exists
if [[ ! " ${CURRENT_ORDER[*]} " =~ " ${PROMOTE} " ]]; then
    echo -e "${RED}🚨 '$PROMOTE' isn’t in the squad.${RESET}"
    echo -e "${BLUE}📡 Available squadmates:${RESET} ${CURRENT_ORDER[*]}"
    exit 1
fi

# Build new order: put PROMOTE at front, keep others in order
NEW_ORDER=("$PROMOTE")
for svc in "${CURRENT_ORDER[@]}"; do
    if [ "$svc" != "$PROMOTE" ]; then
        NEW_ORDER+=("$svc")
    fi
done

# Apply new order
echo -e "${GREEN}🚀 NetShifter activated:${RESET} promoting '${BOLD}${PROMOTE}${RESET}' to ${YELLOW}squad captain 👑${RESET}"
sudo networksetup -ordernetworkservices "${NEW_ORDER[@]}"

# Show new squad lineup
echo -e "${MAGENTA}✨ Fresh squad lineup locked in:${RESET}"
for i in "${!NEW_ORDER[@]}"; do
    pos=$((i+1))
    if [ "${NEW_ORDER[$i]}" == "$PROMOTE" ]; then
        echo -e "   ${pos}. ${GREEN}${BOLD}${NEW_ORDER[$i]} 🔥 (captain)${RESET}"
    else
        echo -e "   ${pos}. ${CYAN}${NEW_ORDER[$i]}${RESET}"
    fi
done

echo -e "${YELLOW}💯 Stay winning with '${PROMOTE}' leading the squad.${RESET}"
