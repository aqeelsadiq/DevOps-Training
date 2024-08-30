#!/bin/bash

# Get the current username
CURRENT_USER=$(whoami)

# count the login user
count_logins() {
    local user=$1
    # Use who command to list logged in users and grep to count occurrences of the username
    who | grep -w "$user" | wc -l  # wc This command counts words, lines, and characters in the input text but here -l tell the wc to used no of lines.
    # -w This option tells grep to search for whole words only.
}

# Count logins for the current user and root
current_user_logins=$(count_logins "$CURRENT_USER")
root_logins=$(count_logins "root")

# Output the login counts
echo "Login count for $CURRENT_USER: $current_user_logins"
echo "Login count for root: $root_logins"

# Compare login counts and display the result
if [ "$current_user_logins" -gt "$root_logins" ]; then
    echo "$CURRENT_USER has more logins."
elif [ "$current_user_logins" -lt "$root_logins" ]; then
    echo "root has more logins."
else
    echo "$CURRENT_USER and root have an equal number of logins."
fi
