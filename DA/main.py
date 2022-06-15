'''
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_bootstrap_components as dbc
import plotly.graph_objs as go
'''

import matplotlib.pyplot as plt
from dash.dependencies import Input, Output

# 기본적인 패키지
import itertools
import pandas as pd
from calendar import monthrange
import datetime

# oracle DB 접근 모듈 import
import cx_Oracle

# 한글 지원
import os
os.putenv('NLS_LANG', '.UTF8')
from pip._internal.req.req_file import preprocess


# 시각화
import plotly.express as px

# 시각화를 위한 패키지
from challenge_functions import *

# 환경변수 설정
#CLNT_LOC = r'' #Oracle Instant Cilent를 설치한 경로를 적어주세요
#os.environ["PATH"] = CLNT_LOC + ";" + os.environ["PATH"] #환경변수 등록

# 한글 지원 방법
os.putenv('NLS_LANG', '.UTF8')
dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
db_conn = cx_Oracle.connect('hifive', 'hifive', dsn)

query = """ \

SELECT * from CHALLENGES

"""

# Load Data
#df = pd.read_sql(query)
df = pd.read_csv("./challenges_20220605.csv", encoding='cp949')

# 데이터 자료형 변경
df = preprocess(df)


# challenge
INQ_CHLG = ['1일만보걷기도전']

# 조회년도
INQ_YEAR = 2021

df_monthly = monthly_df(df, INQ_CHLG, INQ_YEAR)
monthly_plot(df_monthly)


# challenge
INQ_CHLG = ['카페에서텀블러사용도전', '1일만보걷기도전', '1일1커밋도전']

# 조회기간
INQ_STR_DATE = datetime.date(2018, 1, 1)   #조회시작일
INQ_END_DATE = datetime.date(2022, 12, 16) #조회종료일

df_prj_ach = prj_ach_df(df, INQ_CHLG, INQ_STR_DATE, INQ_END_DATE)
prj_ach_plot(df_prj_ach)

'''
cursor.execute('select category, fee from challenges')
row = cursor.fetchall()
df = pd.DataFrame(row)
df.index = list(df[0]) # category
df.plot(kind='bar', color='skyblue')
'''




'''



# Launch the application:

app = dash.Dash()

# Create a Dash Layout that contains a Graph component:
app.layout = html.Div([dcc.Graph(id='old_faithful',
                                 figure={'data':[go.Scatter(x=df['category'],
                                                            y=df['fee'],
                                                            mode='markers')],
                                         'layout':go.Layout(title='Old Faithful Eruptions',
                                                            xaxis={'title':'Duration'},
                                                            yaxis={'title':'Interval'})})])

if __name__ == '__main__':
    app.run_server()'''