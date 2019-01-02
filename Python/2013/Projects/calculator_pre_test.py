def main():
    i = 0
    while i == 0:
        print('Welcome to the calculator!')
        print('--------------------------')
        n1 = float(input('Please enter the first operand: '))
        n2 = float(input('Please enter the second operand: '))
        operator = input('Please (+) to Add, (-) Subtract, (*) Multiply, (/)' +
                        'Divide, or [E] to exit: ')

        i = calc(n1, operator, n2)

def calc(n1, operator, n2):
    if operator == '+':
        print(n1, '+', n2, 'is', (n1 + n2)
    elif operator == '-':
        print(n1, '-', n2, 'is', (n1 + n2)
    elif operator == '/':
        print(n1, '/', n2, 'is', (n1 / n2)
    elif operator == '*':
        print(n1, '*', n2, 'is', (n1 * n2)
    elif operator == 'E' or operator == 'e':
        return 1
    else:
        print ('Invalid choice. ')


main()
