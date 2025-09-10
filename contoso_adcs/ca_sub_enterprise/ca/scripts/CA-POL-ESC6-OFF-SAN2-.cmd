@echo off

net stop certsvc 

certutil -setreg policy\editflags -EDITF_ATTRIBUTESUBJECTALTNAME2

net start certsvc