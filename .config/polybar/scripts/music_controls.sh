#!/bin/bash

# Main logic
case "$(playerctl -i chromium status 2>/dev/null)" in
    Playing)
        echo "  "
        ;;
    Paused)
        echo "  "
        ;;
    *)
        echo ""
        ;;
esac
