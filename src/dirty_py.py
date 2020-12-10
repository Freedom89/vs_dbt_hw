import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

a = 1
B = 2
print(a + B)
x = [1, 2, 3, 4]
df_x = pd.DataFrame(x)
df_x

okay = {"apple": "blue", "orange": 1}


# Create a list of evenly-spaced numbers over the range
x = np.linspace(0, 20, 100)
plt.plot(x, np.sin(x))  # Plot the sine of each x point
plt.show()  # Display the plot


def MEOW(x, y):
    return x ** 2


y = MEOW(10, 20)


def another_MEOW(x: int, y):
    return x * 2


another_MEOW("hello")

dict = {
    "apple": "red",
    "grape": "purple",
    "kaka": "hello",
    "hi": "2352352353434342352342",
}


def hello(x, y, z):
    return x


import pandas as pd

dict1 = {"a": 1}
dict2 = {"a": 4, "b": 2}
