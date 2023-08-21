#!/bin/sh

hyprctl activewindow -j | jq .workspace.id
