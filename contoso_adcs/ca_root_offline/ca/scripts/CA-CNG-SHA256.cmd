@echo off

certutil -setreg ca\csp\CNGHashAlgorithm SHA256

net stop certsvc && net start certsvc
