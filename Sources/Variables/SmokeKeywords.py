import os
import sys
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from robot.run import RobotFramework
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
import signal
from selenium.webdriver.common.keys import Keys

class SmokeKeywords:

    def __init__(self):
        pass

    @staticmethod
    def current():
        seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
        current_driver = seleniumlib.driver
        return current_driver

    @staticmethod
    def custom_input_text_and_click_enter(place):
        driver = SmokeKeywords.current()
        driver.find_element_by_css_selector('#search > div.container-wide > div.input.search-input-wrapper > input').send_keys(place, Keys.ENTER)

    @staticmethod
    def Scroll_Down_Please():
        driver = SmokeKeywords.current()
        driver.execute_script("window.scrollTo(0, 5000)")
        time.sleep(10)





