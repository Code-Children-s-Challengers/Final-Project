import sys
import codecs
sys.stdout=codecs.getwriter("utf-8")(sys.stdout.detach())

import sys
import codecs
sys.stdout=codecs.getwriter("utf-8")(sys.stdout.detach())

import numpy as np
import pandas as pd
import csv

#matplotlib 라이브러리
import matplotlib
import matplotlib.pyplot as plt

#날짜 계산을 위한 라이브라러
from datetime import datetime, timedelta




from flask import Flask, render_template   # flask 라이브러리에서 Flask Class를 import
# 이 클래스의 인스턴스가 WSGI(Web Server Gateway interface) App이 됨
from flask_restx import Api, Resource # API 구현을 위한 API 객체 import

app = Flask(__name__)       # Flask라는 클래스의 객체를 생성하고 인자로 __name__을 입력
                            # 단일 모듈 사용시 __name__을 인자로 사용해야 한다.
                            # 패키지를 사용하는 경우, 패키지 이름으로 작성하는 것이 좋음
# api = Api(app)              # Flask 객체에 Api 객체 등록

                            # Router를 부르면 함수 실행
@app.route('/')             # route() 데코레이터를 사용, URL이 어떤 함수를 실행시키는지 알려줌.
def root_world():           # root_world() 함수 선언 및 정의
    result = 'root world'
    return result           # 사용자에게 보여줄 메시지 return

                            # Router를 부르면 함수 실행
@app.route('/hello', methods=['GET', 'POST'])        # route() 데코레이터를 사용, URL이 어떤 함수를 실행시키는지 알려줌.
def hello_world():          # hello_world() 함수 선언 및 정의
    result = 'hello world'
    return result           # 사용자에게 보여줄 메시지 return

# Router를 부르면 함수 실행
@app.route('/test', methods=['GET', 'POST'])        # route() 데코레이터를 사용, URL이 어떤 함수를 실행시키는지 알려줌.
def graph_test():          # hello_world() 함수 선언 및 정의
    return render_template(
        #'./flask/index.html'
        exec(open("./graph_test2.py", encoding='UTF8').read())
    )


if __name__ == '__main__':  # run() 함수를 사용하여 개발한 어플리케이션을 로컬 서버로 실행
    app.debug = True        # Error 없으면 자동으로 서버 재시작
    app.run()