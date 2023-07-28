#!/usr/bin/env python3

import os
import glob
import pandas as pd

def concatenate_data(download_dir, output_file):
    all_files = glob.glob(os.path.join(download_dir, "*.csv"))
    df_list = []

    for file in all_files:
        df = pd.read_csv(file)
        df_list.append(df)

    concatenated_df = pd.concat(df_list)
    concatenated_df.to_csv(output_file, index=False)

    print("Data concatenated and saved to:", output_file)

if __name__ == "__main__":
    import sys

    if len(sys.argv) < 3:
        print("Usage: python concatenate_data.py <download_directory> <output_file>")
        sys.exit(1)

    download_dir = sys.argv[1]
    output_file = sys.argv[2]

    concatenate_data(download_dir, output_file)

