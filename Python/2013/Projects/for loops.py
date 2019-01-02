def main():
    menu()


def diamond():
    maxStars = int(input('How many stars maximum for the diamond? '))
    r = maxStars
    print()
    
    for i in range(1, maxStars + 2, 2):
        print((' ' * r) + ('*' * i))
        r -= 1
            
    for m in range(maxStars - 2, 0, -2):
        print(  (' ' * (r + 2)) + ('*' * m)  )
        r += 1
            
    print()

def triangle():
    print()
    maxStars = int(input('How many stars for the bottom length of the triangle? '))
    print()
    for i in range(1, maxStars + 1, 1):
        print ('*' * i)
    print()


def hollowTriangle():
    print()
    maxStars = int(input('How many stars for the bottom length of the triangle? '))
    print()

    for i in range(1, maxStars, 1):
        if (i == 1):
            print ('*')
        else:
            print('*' + ' ' * (i - 2) + '*')

    print('*' * maxStars)  
    print()

    
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
