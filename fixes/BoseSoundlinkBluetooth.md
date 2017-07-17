# Problem Description
When connecting to computer headphone would only connect in headset mode.
Headset would say "call from" after starting playback
Quality was very sub-optimal. Headset could not be set to High Fidelity Playback (A2DP)
# Solution Used
Edit /etc/pulse/default.pa
Comment out line: "load-module module-bluetooth-discover"
Edit /usr/bin/start-pulseaudio-x11
Add "/usr/bin/pactl load-module module-bluetooth-discover" after SESSION_MANAGER if statement.
Reboot
Found a post with the following on archlinux.org forums:

`Bug and possible solution: actually I found a bug in that make the headset unusable, it seems that the pulse audio module: module-bluetooth-discover works only if started after the X11 session is up. So I have a workaround.
Edit the file:
/etc/pulse/default.pa
and comment out (with an # at the beginning of the line) the following line:
load-module module-bluetooth-discover
now edit the file:
/usr/bin/start-pulseaudio-x11
and after the lines:
   if [ x”$SESSION_MANAGER” != x ] ; then
           /usr/bin/pactl load-module module-x11-xsmp “display=$DISPLAY session_manager=$SESSION_MANAGER” > /dev/null
		       fi
			   add the following line:
			       /usr/bin/pactl load-module module-bluetooth-discover
				   This way the Pulse audio’s Bluetooth modules will not be downloaded at boot time but after x11 is started.`
