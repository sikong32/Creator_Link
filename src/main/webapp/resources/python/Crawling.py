import requests
import oracledb
import time
import re
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.common.exceptions import NoSuchElementException
from matplotlib import pyplot as plt

#한글 지정
plt.rcParams['font.family'] ='Malgun Gothic'
plt.rcParams['axes.unicode_minus'] =False

#클라이언트 오라클
script_dir = os.path.dirname(os.path.abspath(__file__))
instantclient_dir = os.path.normpath(os.path.join(script_dir, '..', 'instantclient_11_2'))
print(instantclient_dir)
oracledb.init_oracle_client(lib_dir=r"C:\github\Creator_Link\src\main\webapp\resources\python/instantclient_11_2") #경로(한글x)
#oracledb.init_oracle_client(lib_dir=r"../instantclient_11_2") #경로(한글x)
connect = oracledb.connect(user='crering', password='12345',dsn='localhost')
c=connect.cursor()#쿼리 저장 할 수 있게 설정

c.execute("TRUNCATE TABLE broadcast_tbl")
connect.commit()

# Chrome 드라이버 옵션 설정
options = webdriver.ChromeOptions()
#options.add_argument("headless")

# 크롬 드라이버 생성
driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()),options=options)

# 브라우저 종료를 위한 함수
def close_driver(driver):
    try:
        driver.quit()
    except Exception as e:
        print(f"Error closing the driver: {e}")


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
                print("방송 이미지 오류")
                vido = "1.jpg"  # 기본 이미지 경로
            image_src = i.find_element(By.CLASS_NAME, "video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
            live = int(i.find_element(By.CLASS_NAME, "video_card_badge__w02UD").text.replace('명 시청', '').replace(',', ''))
            name = i.find_element(By.CLASS_NAME, "name_text__yQG50").text
            c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,image_src,name,live,"치지직_메인"))
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
    for i in range(1,10):
        link = items[i].find_element(By.TAG_NAME,"a").get_attribute("href")
        saram = items[i].find_element(By.TAG_NAME,"em").text
        vido = items[i].find_element(By.TAG_NAME,"img").get_attribute("src")
        imag = items[i].find_element(By.CSS_SELECTOR,"div.cBox-info > a > img").get_attribute("src")
        name = items[i].text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name.split('\n', 1)[0],int(saram.replace(',', '')),"아프리카_메인"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name.split('\n', 1)[0])
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 아프리카메인")

#치지직 수다
driver.get("https://chzzk.naver.com/category/ETC/talk")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CLASS_NAME, "component_item__\+48tj")
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,13):
        link = items[i].find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
        saram = items[i].find_element(By.CLASS_NAME,"video_card_badge__w02UD").text.replace('명 시청', '').replace(',', '')
        try:
            vido = items[i].find_element(By.CLASS_NAME,"video_card_image__yHXqv").get_attribute("src")
        except NoSuchElementException:
            print("방송 이미지 오류")
            vido = "1.jpg"  # 기본 이미지 경로
        imag = items[i].find_element(By.CLASS_NAME,"video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
        name = items[i].find_element(By.CLASS_NAME,"name_text__yQG50").text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name,saram,"치지직_수다"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name)
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 치치직 수다")

#치지직 음악
driver.get("https://chzzk.naver.com/category/ETC/music")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CLASS_NAME, "component_item__\+48tj")
    print(len(items))
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,13):
        link = items[i].find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
        saram = items[i].find_element(By.CLASS_NAME,"video_card_badge__w02UD").text.replace('명 시청', '').replace(',', '')
        try:
            vido = items[i].find_element(By.CLASS_NAME,"video_card_image__yHXqv").get_attribute("src")
        except NoSuchElementException:
            print("방송 이미지 오류")
            vido = "1.jpg"  # 기본 이미지 경로
        imag = items[i].find_element(By.CLASS_NAME,"video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
        name = items[i].find_element(By.CLASS_NAME,"name_text__yQG50").text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name,saram,"치지직_음악"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name)
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 치치직 음악")

#치지직 종합게임
driver.get("https://chzzk.naver.com/category/ETC/various_games")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CLASS_NAME, "component_item__\+48tj")
    print(len(items))
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,13):
        link = items[i].find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
        saram = items[i].find_element(By.CLASS_NAME,"video_card_badge__w02UD").text.replace('명 시청', '').replace(',', '')
        try:
            vido = items[i].find_element(By.CLASS_NAME,"video_card_image__yHXqv").get_attribute("src")
        except NoSuchElementException:
            print("방송 이미지 오류")
            vido = "1.jpg"  # 기본 이미지 경로
        imag = items[i].find_element(By.CLASS_NAME,"video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
        name = items[i].find_element(By.CLASS_NAME,"name_text__yQG50").text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name,saram,"치지직_종합게임"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name)
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 치치직 종합게임")

#치지직 고전 게임
driver.get("https://chzzk.naver.com/category/ETC/classic_game")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CLASS_NAME, "component_item__\+48tj")
    print(len(items))
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,13):
        link = items[i].find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
        saram = items[i].find_element(By.CLASS_NAME,"video_card_badge__w02UD").text.replace('명 시청', '').replace(',', '')
        try:
            vido = items[i].find_element(By.CLASS_NAME,"video_card_image__yHXqv").get_attribute("src")
        except NoSuchElementException:
            print("방송 이미지 오류")
            vido = "1.jpg"  # 기본 이미지 경로
        imag = items[i].find_element(By.CLASS_NAME,"video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
        name = items[i].find_element(By.CLASS_NAME,"name_text__yQG50").text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name,saram,"치지직_고전게임"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name)
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 치치직 고전게임")

#치지직 아트
driver.get("https://chzzk.naver.com/category/ETC/art")
time.sleep(2)
try:
    # 인기 방송 중인 클래스 하위에 있는 요소를 찾습니다.
    items = driver.find_elements(By.CLASS_NAME, "component_item__\+48tj")
    print(len(items))
    # 찾은 모든 요소에 대해 반복합니다.
    for i in range(1,13):
        link = items[i].find_element(By.CLASS_NAME,"video_card_thumbnail__QXYT8").get_attribute("href")
        saram = items[i].find_element(By.CLASS_NAME,"video_card_badge__w02UD").text.replace('명 시청', '').replace(',', '')
        try:
            vido = items[i].find_element(By.CLASS_NAME,"video_card_image__yHXqv").get_attribute("src")
        except NoSuchElementException:
            print("방송 이미지 오류")
            vido = "1.jpg"  # 기본 이미지 경로
        imag = items[i].find_element(By.CLASS_NAME,"video_card_profile__QHbN7").find_element(By.TAG_NAME,"img").get_attribute("src")
        name = items[i].find_element(By.CLASS_NAME,"name_text__yQG50").text
        c.execute("insert into BROADCAST_TBL values(BC_NUMBER_SQL.nextval,:1,:2,:3,:4,:5,:6)",(link,vido,imag,name,saram,"치지직_아트"))
        print(link)
        print(vido)
        print(imag)
        print(saram)
        print(name)
except Exception as e:
    print("오류 발생:", e)
print("여기까지는 치치직 아트")

close_driver(driver)  # 스크립트 종료 시 항상 드라이버 종료

connect.commit()
# 브라우저 종료
#driver.quit()
print("프로그램 종료")
