##############
## Main
##############

def main():
    menu()

##############
## Diamond
##############
    
def diamond():
    print()
    numberOfStars = int(input('Enter maximum number of stars: '))

    for x in range(1, numberOfStars, 1):
        print('*' * x)
        
    for x in range(numberOfStars, 1, -1):
        print ('*' * x)

    print('*')
    print()

##############
## Hollow Triangle
##############
    
def hollowTriangle():
    print()
    numberOfStars = int(input('Enter maximum number of stars: '))

    for i in range(0, numberOfStars - 1):
        if i == 0:
            print('*')
        else:
            print('*' + ' ' * (i - 1) + '*')
        
    print('*' * numberOfStars)
    print()

##############
## Triangle
##############

def triangle():
    print()

    numberOfStars = int(input('Enter maximum number of stars: '))

    for x in range (1, numberOfStars + 1, 1):
        print ('*' * x)

    print()


    
##############
## Menu
##############
    
def menu():
    choice = 0
    while choice != 4:
        print('Welcome to the Asterisk Shape Program!')
        print('--------------------------------------')
        print('1) Diamond')
        print('2) Triangle')
        print('3) Hollow Triangle')
        print('4) Exit')

        choice = int(input())

        if choice == 1:
            diamond()
        elif choice == 2:
            triangle()
        elif choice == 3:
            hollowTriangle()
        elif choice == 4:
            print()
            response = input('Are you sure you want to exit? Y/N: ')
            if response == 'y' or response == 'Y':
                return
            elif response == 'N' or response == 'n':
                choice = 0
                print()

main()
