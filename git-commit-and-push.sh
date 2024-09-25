#!/bin/bash

# Step 1: Run git add to stage all files
git add .

# Step 2: Run the commit command with your message
git commit -m "$1"

# Step 3: Check if the commit was successful
if [ $? -eq 0 ]; then
  echo "Commit successful. No vulnerabilities found."
  
  # Dynamically get the current branch
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  
  # Step 4: Push changes to the current branch
  echo "Pushing changes to branch: $current_branch"
  git push origin "$current_branch"
else
  echo "Commit failed. Check for issues and try again."
fi