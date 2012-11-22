#!/usr/bin/python

# ----- GETIM.PY // LISTEN FOR AN RECEIVED MESSAGE ------------#
################################################################
# MOST OF THIS SCRIPT  WAS TAKEN FROM THE PIDGIN DEVELOPER WIKI#
# PLEASE VISIT http://developer.pidgin.im/ FOR MORE INFORMATION#
################################################################

def conky_im(account, sender, message, conversation, flags):
reg = '<(.|\n)+?>'                  # REGEX FOR HTML TAGS
message = re.sub(reg,'',message)    # REMOVE HTML TAGS
sender = sender.split("@")[0]       # GET GCHAT NAME
message = message[0:24]             # LIMIT TO 25 CHARS
file = '~/.conky/Scripts/pidgin.dat'# LOCATION OF DATA FILE
fim = open(file,"w")
IM = sender + " said: " + message
fim.write(IM)
fim.close()

import dbus, gobject, re
from dbus.mainloop.glib import DBusGMainLoop
dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
bus = dbus.SessionBus()

bus.add_signal_receiver(conky_im,
                dbus_interface="im.pidgin.purple.PurpleInterface",
                signal_name="ReceivedImMsg")

loop = gobject.MainLoop()
loop.run()
