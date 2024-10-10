#!/usr/bin/env osascript

on run argv
	if (length of argv) is not equal to 2 then
		tell application "Terminal"
			return name of current settings of first window
		end tell
	else if (length of argv) = 2 then
		tell application "System Events"
			tell appearance preferences
				set is_dark to dark mode
			end tell
		end tell

		tell application "Terminal"
			set light_theme to (item 1 of argv)
			set dark_theme to (item 2 of argv)
			set current_theme to name of current settings of first window

			if is_dark then
			#	return "dark"
				set current settings of first window to settings set dark_theme
			else
				set current settings of first window to settings set light_theme
			end if
		end tell
	end if
end run
