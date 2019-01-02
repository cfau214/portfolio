################
## Main Function
def main():
    menu()
    print('-------------')
    print('Please press <return> or <enter> to close the program.')
    input()


################
## Menu Function
def menu():
    i = 1
    a = 0
    while i == 1:
        print('My First Menu')
        print('--------------')
        print('1. Hello World')
        print('2. Goodbye')
        print('3. Exit Program')

        #Get Input
        try:
            a = int(input())
            if a == 1:
                option_one()
            elif a == 2:
                option_two()
            elif a == 3:
                i = option_three()
                if i == 0:
                    return
                else:
                    i = 1
            else:
                print('Invalid choice.\n')
        except ValueError:
            print('Invalid choice.\n')
            
        
            
################
## Menu Option One
def option_one():
    print('\nYou pressed one. Hello!')
    input('Please enter to continue.')
    print()

################
## Menu Option Two
def option_two():
    print('\nYou pressed two. Goodbye!')
    input('Please enter to continue.')
    print()

################
## Menu Option Three
def option_three():
    a = 1
    while a == 1:
        response = input('Are you sure you want to exit? Y/N: ')
        if response == 'Y' or response == 'y':
            return 0
        elif response == 'N' or response == 'n':
            print()
            return 1
        else:
            print('Please enter Y to close the program or N to stay.')
            a = 1 
    
main()
