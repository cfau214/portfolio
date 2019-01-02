def main():
    i = 0
    while i == 0:
        n1 = float(input('Enter the first operand: '))
        n2 = float(input('Enter the second operator: '))
        operator = input('Enter Add(+), Subtract(-)' +
                         ', Multiply(*), Divide(/), or (E) to exit: ')
        i = calc(n1, operator, n2)
        


def calc(n1, operator, n2):
    if operator == '+':
        print()
        print('------------------')
        print(n1, operator, n2, ' = ', (n1 + n2))
        print()
        return 0
    elif operator == '-':
        print()
        print('------------------')
        print(n1, operator, n2, ' = ', (n1 - n2))
        print()
        return 0
    elif operator == '*':
        print()
        print('------------------')
        print(n1, operator, n2, ' = ', (n1 * n2))
        print()
        return 0
    elif operator == '/':
        print()
        print('------------------')
        print(n1, operator, n2, ' = ', (n1 / n2))
        print()
        return 0
    elif operator == 'E' or operator == 'e':
            try:
                print()
                ask_quit = input('Are you sure you want to exit? Y/N: ')
                
                if ask_quit == 'Y' or ask_quit == 'y':
                      return 1
                elif ask_quit == 'N' or ask_quit == 'n':
                      print()
                      return 0
                else:
                    print('Invalid input. Returning to calculator....')
                    return 0
            except ValueError:
                print('Invalid Response. Quitting to main menu.')
                print()
                return 0
    else:
        print('Invalid operator. Please try again.')
        return 0

print('Welcome to the calculator! When finished, enter [E]' +
      ' as the operator to Exit.')
print('------------------')
main()
