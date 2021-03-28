"""
PYTHON AUTOMATIC LOGIN
AUTHOR : FADHIL
GITHUB : FADHILSAHEER
"""

# Importing Modules

from selenium import webdriver
from selenium.webdriver.common.keys import Keys as keys 
import time

browser = webdriver.Chrome()

# Gmail Login

def google(username, password):
    browser.get("https://mail.google.com/mail/u/0/#inbox")
    gmail_user = browser.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[1]/div/div[1]/div/div[1]/input')
    gmail_user.send_keys(username)
    time.sleep(2)
    gmail_user.send_keys(keys.ENTER)
    time.sleep(5)
    gmail_pass = browser.find_element_by_xpath('/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[1]/div[1]/div/div/div/div/div[1]/div/div[1]/input')
    gmail_pass.send_keys(password)
    time.sleep(2)
    gmail_pass.send_keys(keys.ENTER)

def facebook(username, password):
    browser.get('https://www.facebook.com/')  
    driver = browser
    
    username_box = driver.find_element_by_id('email') 
    username_box.send_keys(username)
    
    password_box = driver.find_element_by_id('pass') 
    password_box.send_keys(password)
    time.sleep(5)

    login_box = driver.find_element_by_xpath('/html/body/div[1]/div[2]/div[1]/div/div/div/div[2]/div/div[1]/form/div[2]/button')
    login_box.click() 
    time.sleep(5)

def instagram(username, password):
    browser.get("https://www.instagram.com/")
    time.sleep(5)

    user_box = browser.find_element_by_xpath('/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div/div[1]/div/label/input')
    user_box.send_keys(username)

    password_box = browser.find_element_by_xpath('/html/body/div[1]/section/main/article/div[2]/div[1]/div/form/div/div[2]/div/label/input')
    password_box.send_keys(password)

    time.sleep(5)

    password_box.send_keys(keys.ENTER)

def twitter(username, password):
    browser.get("https://twitter.com/")
    time.sleep(5)

    username_box = browser.find_element_by_xpath('/html/body/div/div/div/div/main/div/div/div/div[1]/div[1]/div/form/div/div[1]/div/label/div/div[2]/div/input')
    username_box.send_keys(username)
    
    password_box = browser.find_element_by_xpath('/html/body/div/div/div/div/main/div/div/div/div[1]/div[1]/div/form/div/div[2]/div/label/div/div[2]/div/input')
    password_box.send_keys(password)
    time.sleep(5)

    password_box.send_keys(keys.ENTER)

def github(username, password):
    browser.get("https://github.com/login")

    user_box = browser.find_element_by_xpath('/html/body/div[3]/main/div/form/div[4]/input[1]')
    user_box.send_keys(username)

    password_box = browser.find_element_by_xpath('/html/body/div[3]/main/div/form/div[4]/input[2]')
    password_box.send_keys(password)

    time.sleep(5)

    password_box.send_keys(keys.ENTER)


