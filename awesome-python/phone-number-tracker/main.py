import phonenumbers
from phonenumbers import geocoder
from phonenumbers import carrier
import pyfiglet


def show_details(number):
    try:
        phone_number = phonenumbers.parse(number)
        number_location = geocoder.description_for_number(phone_number, 'en')
        service_provider = carrier.name_for_number(phone_number, 'en')

        print(f"Details For {str(number)}")
        print("----------\n")
        print(f"Number : {str(number)}")
        print(f"Locations: {str(number_location)}")
        print(f"Provider : {str(service_provider)}")
        exit(0)

    except:
        print("\nEnter a valid phone number with country code !!\neg: +910000000000\n")
        exit(0)


def main():
    print(pyfiglet.figlet_format("PhoneTracker"))
    phone_number = input("Enter a valid phone number :} ")

    show_details(phone_number)


if __name__ == "__main__":
    main()
