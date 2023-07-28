#!/bin/bash

# Define the directories
download_dir="/home/cloudshell-user/downloads"
output_dir="/home/cloudshell-user/output"
log_dir="/home/cloudshell-user/logs"

# Generate logs
log_file="${log_dir}/climate_data_download.log"

# Function to log messages
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >> "$log_file"
}

log "Starting data download and concatenation."

# Download data using wget
for year in {2020..2022}; do
    wget --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=48549&Year=${year}&Month=2&Day=14&timeframe=1&submit=Download+Data" -P "$download_dir"
done

log "Data downloaded successfully."

# Call the Python script for concatenation
python3 concatenate_data.py "$download_dir" "$output_dir/all_years.csv"

log "Concatenation completed successfully."
log "SUCCESS"

