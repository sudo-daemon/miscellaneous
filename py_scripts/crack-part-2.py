import time
import random
import datetime

amount_of_time = random.randint(61, 361)
current_time = datetime.datetime.now().time()

print("Welcome the command line password cracking utility. ")

ipAddress = input("Enter the target user's username: ")

time.sleep(1)
print("User " + str(ipAddress) + " found on machine.")

time.sleep(1)
print("Calculating time remaining...")

time.sleep(2)
print("The password can be cracked in around " + str(amount_of_time) + " seconds from " + str(current_time) + ".")

time.sleep(1)
confirmation = input("Proceed (Y/n)? ")

if confirmation == "y" or confirmation == "Y":
    time.sleep(int(amount_of_time))

    print("We have found a few possible variations of " +str(ipAddress) + "'s decrypted password.")

    contains_actual_password = open(r"./.java-dump-log.txt", "r")
    actual_password = contains_actual_password.read()
    time.sleep(2)

    print(actual_password.capitalize())
    print(actual_password.replace('a', '4'))
    print(actual_password)
    print(actual_password.replace('i', '1'))
    print(actual_password.replace('e', '3'))
    print(actual_password.upper())

else:
    print("Quitting...")
    time.sleep(2)
    exit()
