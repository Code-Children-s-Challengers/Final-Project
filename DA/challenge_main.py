# 기본적인 패키지
import pandas as pd
import datetime

# oracle DB 접근 모듈 import
import cx_Oracle

# 한글 지원
import os
os.putenv('NLS_LANG', '.UTF8')

# 시각화
import dash
# import dash_core_components as dcc
# import dash_html_components as html

from dash import dcc
from dash import html

# 시각화를 위한 패키지
# from HIGHFIVE.challenge.challenge_functions import *
from challenge_functions import *

import warnings                   # 경고 메시지 무시?
warnings.filterwarnings('ignore') # 경고 메시지 무시?

# 환경변수 설정
CLNT_LOC = r'C:\oraclexe\app\oracle\product\11.2.0\client' #Oracle Instant Cilent를 설치한 경로
os.environ["PATH"] = CLNT_LOC + ";" + os.environ["PATH"] #환경변수 등록


IP = 'localhost' #ip
port = 1521 # 숫자
SID = 'xe' # SID

ID = 'hifive' # 유저
PASSWORD = 'hifive' # 비밀번호


query = """ \
SELECT * from CHALLENGES
"""

# connection
dsn_tns = cx_Oracle.makedsn(IP, port, SID)
connection = cx_Oracle.connect(ID, PASSWORD, dsn_tns)

# Load Data
df = pd.read_sql(query, connection)
# df = pd.read_csv("./CHALLENGES_20220616.csv", encoding='cp949')

df = preprocess(df)

# challenge
INQ_CHLG = ['카페에서텀블러사용도전', '1일만보걷기도전', '1일1커밋도전']

# 조회년도
INQ_YEAR = 2021


df_monthly = monthly_df(df, INQ_CHLG, INQ_YEAR)
df_monthly.head()

fig_m = monthly_plot(df_monthly)
fig_m

# challenge
INQ_CHLG = ['카페에서텀블러사용도전', '1일만보걷기도전', '1일1커밋도전']

# 조회기간
INQ_STR_DATE = datetime.date(2018, 1, 1)   #조회시작일
INQ_END_DATE = datetime.date(2022, 12, 16) #조회종료일

# 시각화

df_prj_ach = prj_ach_df(df, INQ_CHLG, INQ_STR_DATE, INQ_END_DATE)
df_prj_ach

fig_prj = prj_ach_plot(df_prj_ach)
fig_prj

# Dash App

# APP 생성
app = dash.Dash()

# Layout 생성
app.layout = html.Div([dcc.Graph(figure=fig_m, style={'display': 'inline-block'}),
                       dcc.Graph(figure=fig_prj, style={'display': 'inline-block'})
                       ])
# APP 실행
if __name__ == '__main__':
    app.run_server()
    app.debug = True  # Error 없으면 자동으로 서버 재시작