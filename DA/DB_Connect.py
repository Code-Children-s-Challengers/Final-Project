import cx_Oracle
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

import dash
import dash_html_components as html
import plotly.graph_objects as go
import dash_core_components as dcc
from dash.dependencies import Input, Output
import dash_bootstrap_components as dbc


# 한글 지원 방법
os.putenv('NLS_LANG', '.UTF8')

# db_conn = cx_Oracle.connect('hifive/hifive@localhost:1521/xe')

dsn = cx_Oracle.makedsn('localhost', 1521, 'xe')
db_conn = cx_Oracle.connect('hifive', 'hifive', dsn)


cursor = db_conn.cursor()
cursor.execute('select category, fee from challenges')

row = cursor.fetchall()
df = pd.DataFrame(row)
df.index = list(df[0]) # category
df.plot(kind='bar', color='skyblue')



