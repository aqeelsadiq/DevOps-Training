#!/bin/bash

# Function will display logged in user information
function show_logged_in_user_info() {
  local username="$1"
  who | grep "^$username " | awk '{print $1, $2, $4, $5}'  # Username, tty, login time, date
}

# Function to display recent login information for all users
function show_last_login_info() {
  local user_info
  while IFS=: read -r username rest; do
# Skip non-user entries (system accounts)
    if [[ "${username}" =~ ^[a-z0-9_-]+$ ]]; then
# Get last login information using lastlog
      last_login_info=$(lastlog -b -t "$username" | head -n 1)
      if [[ -n "$last_login_info" ]]; then
        # Extract relevant fields (username, last login time, date)
        user_info=$(echo "$last_login_info" | awk '{print $1, $3, $4, $5}')
      else
        user_info="$username Never logged in"
      fi
      echo "$user_info"
    fi
  done < /etc/passwd
}

# Option 1: Show logged in user information
if [[ -n "$1" && "$1" == "who" ]]; then
  # Get all logged in users using who
  logged_in_users=$(who | awk '{print $1}')
  for user in $logged_in_users; do
    show_logged_in_user_info "$user"
  done
# Option 2: Show last login information for all users
elif [[ -n "$1" && "$1" == "lastlog" ]]; then
  show_last_login_info
else
  echo "Usage: $0 (who | lastlog)"
  echo "  who: Show information about logged in users."
  echo "  lastlog: Show last login information for all users."
fi
