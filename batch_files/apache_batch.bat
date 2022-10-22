@echo off
:: This batch file run Vagrant commands and opens web page showing the webserver content

:: run Vagrant
cd C:\Users\kazin\vagrant_ubuntu
vagrant up

:: open google chrome instance redirecting to 127.0.0.1:8080/cgi-bin/script.py
cd C:\Program Files (x86)\Google\Chrome\Application
start chrome.exe http://127.0.0.1:4567/cgi-bin/script.py
pause