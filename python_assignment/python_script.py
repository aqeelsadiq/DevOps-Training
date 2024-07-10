import feedparser
import json
import os
import time

# RSS feed URL to fetch updates from AWS
RSS_FEED_URL = 'https://aws.amazon.com/about-aws/whats-new/recent/feed/'

def fetch_aws_rss():
    """ Fetches AWS RSS feed and returns new entries """
    # Parse the RSS feed URL using feedparser
    feed = feedparser.parse(RSS_FEED_URL)
    
    # Initialize a list to store new entries
    new_entries = []
    
    # Iterate over each entry in the parsed feed
    for entry in feed.entries:
        # Extract the 'id' of the entry
        entry_id = entry.get('id')
        
        # Check if the entry_id is not in fetched_entry_ids set (to avoid duplicates)
        if entry_id not in fetched_entry_ids:
            # If it's a new entry, append it to new_entries list
            new_entries.append(entry)
            
            # Add the entry_id to fetched_entry_ids set to track it as fetched
            fetched_entry_ids.add(entry_id)
    
    # Return the list of new entries fetched from the RSS feed
    return new_entries

def load_existing_entries():
    """ Load existing entry IDs from JSON file if it exists """
    # Initialize an empty set to store fetched entry IDs
    fetched_entry_ids = set()
    
    # Check if the JSON file 'fetched_entries.json' exists
    if os.path.exists('fetched_entries.json'):
        # Open 'fetched_entries.json' in read mode
        with open('fetched_entries.json', 'r') as f:
            # Iterate over each line in the file
            for line in f:
                try:
                    # Try to parse each line as JSON and extract the 'id' field
                    entry = json.loads(line.strip())
                    fetched_entry_ids.add(entry['id'])
                except json.JSONDecodeError:
                    # Handle JSON decoding errors if any
                    print(f"Error decoding JSON from line: {line.strip()}")
    
    # Return the set of fetched entry IDs
    return fetched_entry_ids

def save_entries_to_json(new_entries):
    """ Saves fetched entries to JSON file, each entry in a new line """
    # Open 'fetched_entries.json' in append mode
    with open('fetched_entries.json', 'a') as f:
        # Iterate over each new entry in the list
        for entry in new_entries:
            # Serialize the entry as JSON and write it to the file
            json.dump(entry, f)
            # Write a newline character to separate entries in the file
            f.write('\n')

if __name__ == '__main__':
    # Load existing entry IDs from 'fetched_entries.json'
    fetched_entry_ids = load_existing_entries()
    
    # Main loop to continuously fetch and process AWS RSS feed
    while True:
        try:
            # Fetch new entries from AWS RSS feed
            new_entries = fetch_aws_rss()
            
            # If there are new entries fetched
            if new_entries:
                # Print each new entry's title
                for entry in new_entries:
                    print(f"New entry found: {entry.title}")
                
                # Save the new entries to 'fetched_entries.json'
                save_entries_to_json(new_entries)
                
                # Update the fetched_entry_ids set with IDs of new entries
                fetched_entry_ids.update(entry['id'] for entry in new_entries)
            else:
                # If no new entries were fetched, print a message
                print("No new entries found.")
        
        # Exception handling for any errors during fetching or processing RSS feed
        except Exception as e:
            print(f"Error fetching or processing RSS feed: {e}")
        
        # Sleep for 10 seconds before checking again.
        time.sleep(10)
