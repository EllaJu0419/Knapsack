import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as st

def myfunc(x):
  return slope * x + intercept

df = pd.read_csv('data_python.csv', header=0, names=['a','b'])
df = df.groupby('a')['b'].mean().to_dict()
x0 = list(df.keys())
x = [ ]
for i in x0:
  x.append(i/10000)
y = list(df.values())

slope, intercept, r, p_value, std_err = st.linregress(x, y)
func = 'y = '+str(format(slope,'.4f'))+' * x + ('+str(format(intercept, '.4f'))+')'
mymodel = list(map(myfunc, x))
plt.xlabel('Capacity of knapsack/10000')
plt.ylabel('Average running time/s')
plt.scatter(x, y, label='Time')
plt.plot(x, mymodel, label='Best fit line')
plt.legend()
plt.text(0.6, 0.2, func)
plt.title('Time taken for dp method of different capacity')
plt.show()
