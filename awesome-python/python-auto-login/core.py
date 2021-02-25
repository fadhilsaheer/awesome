
#importing module
import pyfiglet 

#home page
def home_page():
    home = pyfiglet.figlet_format("AUTOMATE")
    print(home)

#option page
def option_page():
    print("")
    print("Gmail Login : a \n")
    print("Facebook Login : b\n")
    print("Instagram Login : c\n")
    print("Twitter Login : d \n")
    print("Github Login : e \n\n")
    print("Exit : 1")
    print("")

#pages

class page:
    def __init__(self):
        username = self.username
        password = self.password

    def google(username, password):
        import auth
        auth.google(username, password)

    def facebook(username, password):
        import auth
        auth.facebook(username, password)

    def instagram(username, password):
        import auth
        auth.instagram(username, password)

    def twitter(username, password):
        import auth
        auth.twitter(username, password)

    def github(username, password):
        import auth
        auth.github(username, password)


def ask_input(keyword):
    username = input(f"Enter Your {keyword} :) ")
    password = input("Enter Your Password :) ")

    array = [username, password]
    return array






#checking
def option(opt):

    if opt == "1":
        quit()

    if opt == "a":
        data = ask_input("Gmail Id")
        page.google(data[0], data[1])

    if opt == "b":
        data = ask_input("Facebook Id Or Email")
        page.facebook(data[0], data[1])

    if opt == "c":
        data = ask_input("Instagram Id Or Email")
        page.instagram(data[0], data[1])

    if opt == "d":
        data = ask_input("Twitter Id Or Email")
        page.twitter(data[0], data[1])

    if opt == "e":
        data = ask_input("Githbum Id Or Email")
        page.github(data[0], data[1])

    else:
        return False