#!/bin/sh
# ====== QA Test Script for API Endpoint ======

# API_URL="https://172.31.32.64/registration/"
# LOG_FILE="test_results.log"

# log_message() {
#     echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
# }

# # Clean old log
# > "$LOG_FILE"

# log_message "TC01: Testing POST request with invalid cert (ignore errors)"

# response=$(curl -k -s -o /dev/null -w "%{http_code}" -X POST "$API_URL" \
#   -H "Content-Type: application/json" \
#   -d '{"username": "12456", "password": "P@ssw0rd"}')

# if [ "$response" -eq 200 ]; then
#   log_message "✅ PASS - Valid login returned $response"
#   echo "✅ PASS - Valid login returned $response"
# else
#   log_message "❌ FAIL - Valid login returned $response"
#   echo "❌ FAIL - Valid login returned $response"
# fi


# echo "Enter your name :"
# read name
# echo "Hello, $name!"

# current_datetime=$(date)

# echo "Current date and time: $current_datetime"

# echo "Enter file or folder name name : " 
# read file_name
# if [ -f "$file_name" ] || [ -d "$file_name" ]; then
#     echo "folder or file :  '$file_name' exists."
# else
#     echo "folder or file :  '$file_name' does not exist."
# fi

# Get the root directory (the parent directory of the script)
scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Script directory: $scriptDir"

# Define the path to the virtual environment's activate script
venvPath="$scriptDir/venv/bin/activate"

# Define the directories for reports and tests
reportDir="$scriptDir/report"
testDir="$scriptDir/test"

# Check if the activate script exists
if [ -f "$venvPath" ]; then
    echo "Activating virtual environment at: $venvPath"
    
    # Activate the virtual environment
    source "$venvPath"

    # Run Robot Framework tests with the output directory
    robot --outputdir "$reportDir" "$testDir" "$@"
else
    echo "Virtual environment not found at: $venvPath"
    echo "Please ensure your venv is created with: python3 -m venv venv"
fi