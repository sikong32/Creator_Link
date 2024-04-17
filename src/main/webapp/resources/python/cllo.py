import requests
import oracledb
import time
import re
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException

# # 오라클 db 연결
# oracledb.init_oracle_client(lib_dir="C:\github\Creator_Link\src\main\webapp\resources\python\instantclient-basic-windows.x64-11.2.0.4.0\instantclient_11_2")
# connect = oracledb.connect(user='crering', password='12345',dsn='localhost')
# c = connect.cursor()

# Chrome 드라이버 옵션 설정
options = webdriver.ChromeOptions()
options.add_argument("headless")

# 크롬 드라이버 생성
driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()),options=options)

# 치지직 웹사이트에 접속
driver.get("https://chzzk.naver.com/")
time.sleep(2)
try:
    # "component_item__ynD21" 클래스 하위에 있는 요소를 찾습니다.
    component_items = driver.find_elements(By.CLASS_NAME, "component_item__ynD21")

    # 찾은 모든 요소에 대해 반복합니다.
    for i in component_items:
        try:
            link = i.find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
            try:
                vido = i.find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").find_element(By.TAG_NAME,"img").get_attribute("src")
            except NoSuchElementException:
                vido = "1.jpg"  # 기본 이미지 경로
            image_src = i.find_element(By.CLASS_NAME, "video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
            live = int(i.find_element(By.CLASS_NAME, "video_card_badge__w02UD").text.replace('명 시청', '').replace(',', ''))
            name = i.find_element(By.CLASS_NAME, "name_text__yQG50").text
            # c.execute("insert into BROADCAST_TBL values(:1,:2,:3,:4,:5,:6)",("BC_NUMBER_SQL.nextval",link,vido,image_src,name,live))
            # connect.commit()
            print(link)
            print(vido)
            print(image_src)
            print(live)
            print(name)
        except NoSuchElementException as e:
            print("요소를 찾을 수 없음:", e)
except Exception as e:
    print("오류 발생:", e)
# time.sleep(1)
# 브라우저 종료
# driver.quit()
print("여기까지는 치치직")

# 아프리카 웹사이트에 접속
driver.get("https://www.afreecatv.com/")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CSS_SELECTOR, "li[id^='live_']")
    # print(len(items))
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,11):
        link = items[i].find_element(By.TAG_NAME,"a").get_attribute("href")
        saram = items[i].find_element(By.TAG_NAME,"em").text
        vido = items[i].find_element(By.TAG_NAME,"img").get_attribute("src")
        imag = items[i].find_element(By.CSS_SELECTOR,"div.cBox-info > a > img").get_attribute("src")
        name = items[i].text
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name.split('\n', 1)[0])
except Exception as e:
    print("오류 발생:", e)
# 브라우저 종료
driver.quit()
print("여기까지는 아프리카 티비")
