#!/bin/bash

# Get the list of changed Apex (.cls) or LWC files
changed_files=$(git diff --cached --name-only | grep -E '\.cls$|\.lwc$')

# Check if there are any relevant changes
if [ -z "$changed_files" ]; then
  echo "No relevant changes to scan."
  exit 0
fi

# Convert changed_files into an array
changed_files_array=($changed_files)

# Run the SFDX scanner on each of the changed files
sf scanner:run --target "${changed_files_array[@]}" --format "json" --outfile "precommit-scanner-report.json"

# Check if the JSON report exists
if [ ! -f "precommit-scanner-report.json" ]; then
  echo "Scanner report not found. Please check the scanner command."
  exit 1
fi

# Manually parse the JSON and check for severity 3 issues within violations array
severity_fail_count=$(grep -oP '"severity":\s*3' precommit-scanner-report.json | wc -l)

# Output the fail count for debugging
echo "Severity Fail Count:"
echo "$severity_fail_count"

# Block commit if there are severity 3 issues
if [ "$severity_fail_count" -gt 0 ]; then
  echo "Blocking your commit due to vulnerabilities found with severity 3."
  # Optionally display the report for the user
  # cat precommit-scanner-report.json
  exit 1
else
  echo "No vulnerabilities found. Proceeding with commit."
  exit 0
fi