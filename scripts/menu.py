import sys
import subprocess

def asciiArt():
    

def menu():
    print("1) Show Networks\n2) Attack Networks\n3) Quit\n")
    userInput = input(">")

    if(userInput=="1"):
        subprocess.Popen("./showNetworks.sh", ">", "interfaces.txt")
        print("Available Networks: ")
        subprocess.Popen(["cat","interfaces.txt"])

    elif(userInput=="2"):
        print("Enter Attack Option\n1) Only Capture Handshakes\n2) Only Aggressive Capture Handshakes\n3) Capture and Send to GCP to crack\n4) Agressive Capture and Send to GCP to Crack\n5) Evil Twin (Bwahaha)\n6) Deauth Option\n")
        userInput == input(">")

        if(userInput=="1"):
            sys.call("./captureHandshakes.sh")
        elif(userInput=="2"):
            sys.call("./aggressiveCapture.sh")
        elif(userInput=="3"):
            sys.call("./captureHandshakes.sh; ./sendToGCP.sh")
        elif(userInput=="4"):
            sys.call("./aggressiveCapture.sh; ./sendToGCP.sh")
        elif(userInput=="5"):
            sys.call("./evilTwin.sh")
        elif(userInput=="6"):
            sys.call("./deauth.sh")
    elif(userInput=="3"):
        print("Bye")
        sys.exit(0)
    else:
        print("Wrong input. Try Again.")

def main():
    while(True):
        menu()

main()
