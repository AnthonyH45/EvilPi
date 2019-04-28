#!/usr/bin/python3
import sys
import subprocess
import time
import os

def startInterface():
    subprocess.Popen("./startInterface.sh", shell=True)

def stopInterface():
    subprocess.Popen("./stopInterface.sh", shell=True)

def skull():
    subprocess.call("clear",shell=True)
    subprocess.call("cat skull.txt", shell=True)
    time.sleep(2)

def menu():
    print("1) Show Networks\n2) Attack Networks\n3) Quit")
    userInput = input("> ")

    if(userInput=="1"):
        subprocess.Popen("./showNetworks.sh", shell=True)
        print("Available Networks: ")
        subprocess.call("cat networks.txt", shell=True)
        print("")

    elif(userInput=="2"):
        while(True):
            print("Enter Attack Option\n1) Capture Handshakes\n2) Capture and Send to GCP to crack\n3) Evil Twin (Bwahaha)\n4) Deauth Option\n5) Main Menu")
            userInput = input("> ")
            if(userInput=="1"):
                PROCESS=subprocess.Popen("./captureHandshakes.sh", shell=True)
                PROCESS.wait()
                break
            elif(userInput=="2"):
                PROCESS1=subprocess.Popen("./captureHandshake.sh; ./sendToGCP", shell=True)
                PROCESS.wait()
                break
            elif(userInput=="3"):
                PROCESS=subprocess.Popen("./evilTwin.sh", shell=True)
                PROCESS.wait()
                break
            elif(userInput=="4"):
                PROCESS=subprocess.call("./deauth.sh", shell=True)
                PROCESS.wait()
                break
            elif(userInput=="5"):
                break
            else:
                print("Wrong option. Please try again.")
    elif(userInput=="3"):
        print("Bye")
        #stopInterface()
        #time.sleep(1)
        #os.remove("interfaceToUse.txt")
        sys.exit(0)
    else:
        print("Wrong input. Try Again.")

def main():
    startInterface()
    skull()
    while(True):
        try:
            menu()
        except KeyboardInterrupt:
            print("\n")

main()
