#!/bin/sh
nm-applet --sm-disable   > /dev/null 2>/dev/null &
killall nm-applet
