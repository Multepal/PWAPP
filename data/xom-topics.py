import re
import pandas as pd

bigline = ''
with open('xom-topics.csv', 'r') as xom:
    bigline = ' '.join([line.strip() for line in xom.readlines()])
    bigline = re.sub(r'\s+', ' ', bigline)

data = []
for line in bigline.split(';'):
    data.append(line.split('|'))
df = pd.DataFrame(data, columns=['pos', 'text', 'ana'])
df['text'] = df.text.str.replace(' – ', '')
df = df.sort_values(['ana','text'])
df[['ana', 'text', 'pos']].to_csv('xom-topic-index.csv', sep='|', index=False)

df2 = df.groupby(['ana', 'text']).count()
df2.to_csv('xom-topic-dict.csv', sep='|', index=True)        

