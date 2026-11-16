#!/bin/bash

#####################################################
# name: MC_setup_broken.sh
# Purpose: ask user basic setting configurations
# Date: 4/23/2026
# Version: 0.1
# Creator: Noah
#####################################################

echo "Minecraft Server Configuration"
echo "------------------------------"

# Get administrator input
read -p "Enter game mode: " GMODE
read -p "Enter difficulty: " DIFF
read -p "Enable PVP (true/false): " PVP

echo "Updating server settings..."

# Check current setting (result is not used)
cat server.properties | grep "^gamemode=" > /dev/null

# Update configuration (intentional bugs)
sed -i.bak 's/^gamemode=.*/gamemode=$GMODE/' server.properties
sed -i.bak 's/^difficulty=.*/difficulty=$DIFF/' server.properties
sed -i.bak 's/^pvp=.*/pvp=$PVP/' server.properties

echo "Configuration updated!"
