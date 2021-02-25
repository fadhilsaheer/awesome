"""
PYTHON AUTOMATIC LOGIN
AUTHOR : FADHIL
GITHUB : FADHILSAHEER
"""

#Importing Modules
import core

#main function

def main():
    core.home_page()
    core.option_page()
    opt = input("Enter Your Option :) ")
    result = core.option(opt)
    
    if result == False:
        print("\nNo such command\n")
        main()

    else:
        result

#executing main

if __name__ == "__main__":
    main()