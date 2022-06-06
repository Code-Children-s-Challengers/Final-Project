#!C:\Users\사용자\AppData\Local\Programs\Python\Python39\python.exe
#!C:\Users\fhqk1\AppData\Local\Programs\Python\Python39\python.exe


import sys
import codecs


import numpy as np
import pandas as pd
import csv

#matplotlib 라이브러리
import matplotlib
import matplotlib.pyplot as plt

#날짜 계산을 위한 라이브라러
from datetime import datetime, timedelta

df = pd.read_csv('../data/challenges_20220605.csv', encoding='CP949')

#datetime으로 변환하는 함수
def str_to_date(data):
    str_datetime = '20'+data
    format = '%Y/%m/%d'
    dt_datetime = datetime.strptime(str_datetime,format)
    return dt_datetime

#연도 별 데이터 분류
index_data = {}
for i in range(len(df['START_DAY'])):
    try:
        index_data[df['START_DAY'][i][:2]].append(i)
    except:
        index_data[df['START_DAY'][i][:2]] = [i]

#주말 계산 함수
def week_end(start,days):
    starts = start.weekday()
    week_end = 0
    for i in range(days):
        if starts%7 == 5 or starts%7 == 6:
            week_end += 1
        starts += 1
    return week_end

goal = {}
#달성률 계산
for i in range(len(df['START_DAY'])):
    start = str_to_date(df['START_DAY'][i])
    end = str_to_date(df['END_DAY'][i])
    days = end - start + timedelta(days=1)
    week_ends = week_end(start,days.days)
    do_days = days.days-week_ends
    goal[i] = df['DAILY_COMPLETE'][i]/do_days

for i in index_data:
    xbar = index_data[i]#[0, 1, 2, 3, 4, 5, 6, 7]
    ybar = []
    for j in index_data[i]:
        ybar.append(goal[j])
    plt.figure(figsize=(8,5)) # Setting the figure size
    ax = plt.axes()
    ax.set_facecolor("#ECF0F1") # Setting the background color by specifying the HEX Code
    plt.ylabel('challenge index')
    plt.xlabel('goal_percent')
    plt.title ('year:' +i)
    plt.barh(xbar,ybar,color = '#FFA726')
    plt.show()
