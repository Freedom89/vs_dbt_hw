#%%
import pandas as pd

# %%
df_eg = pd.DataFrame(
    {
        "id": {0: 1, 1: 2, 2: 3},
        "count": {0: 2, 1: 2, 2: 3},
        "sum": {0: 8, 1: 13, 2: 32},
        "max": {0: 5, 1: 7, 2: 15},
        "pct_value": {0: 15.09, 1: 24.53, 2: 60.38},
    }
)
# %%
df_eg
