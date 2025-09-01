@echo off

net stop certsvc 

certutil -setreg CA\InterfaceFlags -IF_ENFORCEENCRYPTICERTREQUEST

net start certsvc