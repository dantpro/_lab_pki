@echo off

certutil -cainfo role

certutil -getreg ca\RoleSeparationEnabled
