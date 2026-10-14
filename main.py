import pandas as pd

data_types = {
    "Rndrng_Prvdr_CCN": "str",
    "Rndrng_Prvdr_State_FIPS": "str",
    "Rndrng_Prvdr_Zip5": "str",
    "DRG_Cd": "str"
}
df = pd.read_csv('data/MUP_INP_RY26_P03_V10_DY24_PrvSvc.csv', dtype=data_types)