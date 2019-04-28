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
        subprocess.Popen("cat networks.txt", shell=True)

    elif(userInput=="2"):
        print("Enter Attack Option\n1) Only Capture Handshakes\n2) Only Aggressive Capture Handshakes\n3) Capture and Send to GCP to crack\n4) Agressive Capture and Send to GCP to Crack\n5) Evil Twin (Bwahaha)\n6) Deauth Option")
        userInput = input("> ")
        if(userInput=="1"):
            subprocess.Popen("./captureHandshakes.sh", shell=True)
        elif(userInput=="2"):
            subprocess.Popen("./aggressiveCapture.sh", shell=True)
        elif(userInput=="3"):
            subprocess.Popen("./captureHandshakes.sh; ./sendToGCP.sh", shell=True)
        elif(userInput=="4"):
            subprocess.Popen("./aggressiveCapture.sh; ./sendToGCP.sh", shell=True)
        elif(userInput=="5"):
            subprocess.Popen("./evilTwin.sh", shell=True)
        elif(userInput=="6"):
            subprocess.Popen("./deauth.sh", shell=True)
    elif(userInput=="3"):
        print("Bye")
        stopInterface()
        time.sleep(1)
        os.remove("interfaceToUse.txt")
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
