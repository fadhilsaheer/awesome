# PHONE TRACKER 🕵️‍♀️

Track phone numbers 😅 this is just a sample project for learning a module named <a href="https://pypi.org/project/phonenumbers/">__PHONENUMBERS__</a> which provides you details about a phone number 📱



## How to use it ?? 🤷‍♀️

1. download the files 📂

   > try not to clone or download the entire repo
   >
   > this repo contains many projects you have to download a lot for simple files
   >
   > download `requirements.txt` & `main.py` 

2. install requirements 🔗

   > I assume that you have pip in your path 
   >
   > if not make sure to do that you can use https://google.com 😁
   >
   >  
   >
   > run the following command
   >
   > `pip install -r requirements.txt`

3. run the file 👨‍💻

   > this project uses python3 make sure you have that 🐍
   >
   > - `python3 main.py`
   > - enter a valid phone number with country code `+910000000000`



## File walkthrough 🚶‍♀️

> This program uses a module named `phonenumbers` which is an awesome package 🙂



importing stuff

```python
import phonenumbers
from phonenumbers import geocoder
from phonenumbers import carrier

import pyfiglet # to display heading nicely
```



in main function we have a prompt for number

```python
number = input("Enter a valid number :} ") # you need to enter a number
```



in find details function we have finding the number location and provider

```python
phone_number = phonenumbers.parse(valid-phone-number) # for other functions

# this will return number location in 'english'
location = geocoder.description_for_number(phone_number, 'en')

# this will return number provider in 'english'
service_provider = carrier.name_for_number(phone_number, 'en')
```

