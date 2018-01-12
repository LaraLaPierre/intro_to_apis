# Exercise: Build a terminal Reddit app
# Display posts from a given subreddit (like /r/programming, the full API url is https://www.reddit.com/r/programming/.json)
# The user can enter a number to see the comments for a given post
# The user can enter `q` to exit the program
# Bonus: Use the tty-prompt gem to make more interactive command line prompts! https://github.com/piotrmurach/tty-prompt

require "unirest"

subreddit_response = Unirest.get("https://www.reddit.com/r/programming/.json")

p subreddit_response.body["data"]["children"][0]["data"]["title"]



