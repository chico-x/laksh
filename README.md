# Automation for honeypot setup

This is an automation script made in bash for automated setup of a honeypot enviornment in ubuntu docker.

I have made this for a college project, so don't expect any specific bug fixes or issues.

feel free to use it or modify according to your use case.


# How to run the script?

before running the script, make sure to change the default values of "your_zero-tier_address" and [my_api_key_laksh]

if you don't know what to enter in place of these placeholder values, read more to know.

After doing that just run 
./install.sh
in your linux terminal
if the script  doesn't run make sure it's executable by running
chmod +x install.sh
 
# what is "your_zero-tier_address" ?

your zero-tier address is the address of the zero-tier network you want to join.
since this script expects you to run this inside a ubuntu docker in a simulated enviornment (like gns3) ,
its neccessary to join into a public zero-tier address to make your honeypot vulnerable and easily accessible (since thats the whole point of having a honeypot)


# what is [my_api_key_laksh]?

Add your telegram bot api key inside those [] brackets after removing the place holder text inside it (my_api_key_laksh)
This is neccessary so that cowrie can send you  log messages  and you can easily view 
The log messages after you receive them in your telegram messenger through your telegram bot api. 


