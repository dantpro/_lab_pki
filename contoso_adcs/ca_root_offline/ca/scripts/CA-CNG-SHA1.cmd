@echo off

certutil -setreg ca\csp\CNGHashAlgorithm SHA1

net stop certsvc && net start certsvc
