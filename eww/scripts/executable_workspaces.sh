#!/bin/sh

hyprctl workspaces -j | jq '[.[] | .id] | sort'
