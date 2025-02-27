# Automation for honeypot setup

This is an automation script made in bash for automated setup of a honeypot enviornment in ubuntu docker.

I have made this for a college project, so don't expect any specific bug fixes or issues.

feel free to use it or modify according to your use case.


# How to run the script?

Before you run the script, make sure to change the default values of "your_zero-tier_address" and [my_api_key_laksh]

if you don't know what to enter in place of these placeholder values, read more to know.

After doing that just run the below command  in your linux terminal
`./install.sh` 
if the script  doesn't run make sure it's executable by running
`chmod +x install.sh`
 And then try running the script again
 
# What is "your_zero-tier_address" ?

Your zero-tier address is the address of the zero-tier network you want to join.
since this script expects you to run this inside a ubuntu docker in a simulated enviornment (like gns3) ,
its neccessary to join into a public zero-tier address to make your honeypot vulnerable and easily accessible (since thats the whole point of having a honeypot)


# What is bot_token and chat_id?

Add your telegram bot token key in the bot_token line and your chat id in chat_id 
This is neccessary so that cowrie can send you  log messages  and you can easily view 
The log messages after you receive them in your telegram messenger through your telegram bot api. 


