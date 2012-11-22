#!/usr/bin/python

# SHOW LAST IM
f='~/.conky/Scripts/pidgin.dat'                  # REPLACE WITH YOUR DATA FILE. ie.CONKYIM.DAT
fim = open(f,'r')
im = fim.read()
print im
fim.close
