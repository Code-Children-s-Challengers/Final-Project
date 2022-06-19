# load packages
import itertools
import pandas as pd
from calendar import monthrange
import datetime
import os
os.putenv('NLS_LANG', '.UTF8')
import plotly.express as px



### 데이터 자료형 변경 및 프로젝트 시작/종료 년도 추출
def preprocess(df):
    
    # 자료형 변경
    df['SDAY'] = pd.to_datetime(df['SDAY'], format="%Y-%m-%d")
    df['EDAY'] = pd.to_datetime(df['EDAY'], format="%Y-%m-%d")
    
    # 년도 계산
    df['START_YEAR'] = df['SDAY'].dt.year
    df['END_YEAR'] = df['EDAY'].dt.year
    
    return df


### 사용자가 선택한 chl_nm 프로젝트에 해당하는 데이터 필터링
def fil_ch_nm(df, chl_nm):
    
    # 데이터 필터링
    df = df[df['NAME'].isin(chl_nm)].copy()
    
    return df


### 사용자가 선택한 year에 해당하는 데이터 필터링
def fil_year(df, year):
    
    # 데이터 필터링
    df = df[(df['START_YEAR']==year) | (df['END_YEAR']==year)]
    
    return df


### 사용자가 선택한 INQ_CHLG, INQ_YEAR 에 해당하는 데이터를 필터링하고 시각화 할 수 있는 데이터 형태로 만듦
def monthly_df(df, chl_nm, year):
    
    # 챌린지에 해당하는 데이터만 필터링
    df = fil_ch_nm(df, chl_nm)
    
    # 조회년도에 해당하는 데이터 필터링
    df = fil_year(df, year)
    
    # 실제 프로젝트 실행 한 일자 계산
    df['PRJ_DAYS'] = df.apply(lambda x: pd.to_datetime([pj_d for pj_d in list(pd.date_range(x['SDAY'], x['EDAY']).strftime('%Y-%m-%d'))]) , axis=1)
    
    # 조회년도에 해당하는 데이터 2차 필터링
    all_prj_days = [d for d in list(itertools.chain(* df['PRJ_DAYS'])) if d.year == year]
    
    
    # 조회기간동안 월별 계산 
    # 1) 프로젝트 성공 횟수 count (done_count)
    # 2) 월별 일수 count (month_days)
    # 3) 성공일수의 비율 (done_ratio)
    prj_success_df = pd.DataFrame({'done_count' : range(1, len(all_prj_days)+1),
                                   'year' : [i.year for i in all_prj_days],
                                   'month' : [i.month for i in all_prj_days]}).groupby(['year', 'month'])['done_count'].count().reset_index()
    prj_success_df['month_days'] = prj_success_df.apply(lambda x : monthrange(x['year'], x['month'])[1], axis=1) * len(chl_nm)
    prj_success_df['done_ratio'] =  (prj_success_df['done_count'] * 100 / prj_success_df['month_days']).round(0)
    
    # INQ_YEAR년도의 모든 달
    all_month = pd.DataFrame({'year' : year,
                            'month' : range(1, 13)})
    
    
    # merge
    final_df = pd.merge(left=all_month, right=prj_success_df, how='left', on=['year', 'month'])
    final_df.columns = ['년', '월', '달성횟수', '월별일수', '월간달성률']
    
    return final_df



### 월별 달성률 시각화
def monthly_plot(df_monthly):
    
    # bar plot 작성
    fig = px.bar(df_monthly,
                 x='월간달성률',
                 y='월', 
                 orientation='h', 
                 text="월간달성률",
                 title="월별 달성률",
                 width=400, height=600) 
    
    # 배경 및 축 옵션설정
    fig.update_layout(plot_bgcolor="#EFF0F2")
    fig.update_traces(textfont_size=12, textangle=0, textposition="outside", cliponaxis=True)
    
    fig['layout']['yaxis'].title.text = ''
    fig['layout']['xaxis'].title.text = '월별 달성 횟수'
    fig['layout']['yaxis']['autorange'] = "reversed"
    
    fig.update_layout(xaxis_range=[0, 100])
    fig.update_xaxes(matches=None, showticklabels=False, visible=True)
    fig.update_layout(yaxis = dict(tickmode = 'array',
                                   tickvals = [1,2,3,4,5,6,7,8,9,10,11,12],
                                   ticktext = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']))

    return fig
    
    
### 사용자가 선택한 chl_nm, str_dt, end_dt 에 해당하는 데이터를 필터링하고 시각화 할 수 있는 데이터 형태로 만듦
def prj_ach_df(df, chl_nm, str_dt, end_dt):
    # 

    # 챌린지에 해당하는 데이터만 필터링
    df = fil_ch_nm(df, chl_nm)
    
    # 조회기간 내 프로젝트 실행 일자 계산 
    df['PRJ_DAYS'] = df.apply(lambda x: len(pd.to_datetime([pj_d for pj_d in list(pd.date_range(x['SDAY'], x['EDAY'])) if (str_dt <= pj_d <= end_dt)])) , axis=1)
    
    # 캠페인별 프로젝트 실행일자 계산
    df_f = df.groupby('NAME')[['PRJ_DAYS']].count().reset_index()

    df_f.columns = ['프로젝트이름', '수행일자']
    
    
    return df_f


### 프로젝트별 달성률 시각화
def prj_ach_plot(df_prj_ach):
    # 배경 및 축 옵션설정
    fig = px.bar(df_prj_ach, x='수행일자', y='프로젝트이름', title="프로젝트별 달성률", orientation='h', width=1200, height=600) 
    fig.update_layout(plot_bgcolor="#EFF0F2")
    
    # 배경 및 축 옵션설정
    fig['layout']['yaxis'].title.text = ''
    fig['layout']['xaxis'].title.text = ''

    fig.update_layout(xaxis_range=[0, 100])


    return fig

