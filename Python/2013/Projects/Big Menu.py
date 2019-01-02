## Testing Menus and current knowledge

def main():
    menu()


def menu():
    i = 0
    while i == 0:
        print('Testing out the Menu!')
        print('---------------------')
        print("1. I'm not exactly sure!")
        print('2. Hello World')
        print('3. Goodbye World')
        print('4. Casino!')
        print('5. How much do you make!?')
        print("6. Fine, I'm ready to exit now!")

        try:
            choice = int(input())

            if choice == 1:
                menu_option_one()
            elif choice == 2:
                menu_option_two()
            elif choice == 3:
                menu_option_three()
            elif choice == 4:
                menu_option_four()
            elif choice == 5:
                menu_option_five()
            elif choice == 6:
                i = menu_option_six()
            else:
                input('Invalid menu option. Press <Enter> or <Return> to ' +
                      ' return to the menu')
                print()
                
        except ValueError:
            input('Invalid menu option. Press <Enter> or <Return> to ' +
                  ' return to the menu')
            print()


def menu_option_one():
    print("\nI'm still not sure, have a good day!\n")
    input('Press <Enter> to return to menu.')
    print()

def menu_option_two():
    print('\nHello World!\n')
    input('Press <Enter> to return to menu.')
    print()

def menu_option_three():
    print('\nGoodbye World!\n')
    input('Press <Enter> to return to menu.')
    print()

def menu_option_four():
    print('\nTime to go to the casino! But I have no money, so too bad.\n')
    input('Press <Enter> to return to menu.')
    print()

def menu_option_five():
    input('Press <Return> or <Enter> to begin calculating how much you make ' +
          'per year!')
    print()
    calculate_annual_pay()

def menu_option_six():
    i = 0
    while i == 0:
        repeat = input('Are you sure you want to exit? [Y] for yes or [N] for no: ')

        if repeat == 'Y' or repeat == 'y':
            return 1
        elif repeat == 'N' or repeat == 'n':
            print()
            return 0
        else:
            print('Invalid input.')

def calculate_annual_pay():
    r = 0
    while r == 0:
        rate = float(input('Please enter your hourly wage: $'))
        hours = float(input('Please enter how many hours per week you work: '))
        annualpay = float((rate * hours) * 52)
        print('Your annual pay is: ', format(annualpay, ',.2f'))
        print()
        
        i = 0
        while i == 0:
            repeat = input('Would you like to calculate another annual pay total? Y/N: ')
            
            try:
                if repeat == 'Y' or repeat == 'y':
                    i = 1
                elif repeat == 'N' or repeat == 'n':
                    print()
                    return
                else:
                    print('Invalid input. \n')

            except ValueError:
                print('Invalid input.\n ')

            
    

main()
input('Please press <Enter> or <Return> to exit the program.')
