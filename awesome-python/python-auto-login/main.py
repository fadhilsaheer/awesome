import os
import platform

try:
    os.system("pip3 install selenium")
    os.system("pip3 install pyfiglet")
except:
    os.system("pip install selenium")
    os.system("pip install pyfiglet")

os.system("python --version")

print("Run 'index.py' according to you python version")
