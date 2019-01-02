#
# prime number checker
repeat = 0
print('Prime number checker! Enter 0 when finished')
print('-------------------------------------------')

while repeat == 0:

    # Number to check
    primenumber = int(input('Enter a number to check if it is prime: '))

    # Checks for sentinel. If sentinel was entered, close program
    if primenumber <= 0:
        repeat = 1
    else:
        prime = True
        print()
        print('Factors of ', primenumber, ':', sep = '')
        print('-----')

        # Prime Number Checker, count increments for every factor. If no factors, count remains 0.
        # Otherwise, it displays the current loop number, which is also a factor of the number
        # that was input!
        for num in range(2, primenumber, 1):
            if ((primenumber % num) == 0):
                print(num)
                prime = False
            if num > (primenumber / 2):
                break

        print('-----')
        # Checks count. If it's greater than 0, then there was a factor. If still 0, then prime!
        if prime == True:
            print(primenumber, 'is a prime number!')
        else:
            print(primenumber, 'is NOT a prime number')
        print('_____________________________________________________')
        print('_____________________________________________________')
        print()


