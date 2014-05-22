#!/bin/sh
if [ -n "$DISPLAY" ]; then
    exec gvim "$@"
fi
exec vim "$@"
