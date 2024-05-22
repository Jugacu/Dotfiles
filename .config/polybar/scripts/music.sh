#!/bin/bash

# Function to display scrolling text
scroll_text() {
    local prefix="$1"
    local title="$(playerctl -i chromium metadata xesam:title)"
    local artist="$(playerctl -i chromium metadata xesam:artist)"
    echo "󰝚 $prefix$title - $artist"
}

# Main logic
case "$(playerctl -i chromium status 2>/dev/null)" in
    Playing)
        scroll_text ""
        ;;
    Paused)
        scroll_text ""
        ;;
    *)
        echo "󰝚 Offline"
        ;;
esac
