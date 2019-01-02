#
# prime number checker
primenumber = int(input('Enter a number to check if it is prime: '))
count = 0
print()
print('Factors:')
print('-----')

for num in range(2, primenumber, 1):
    if ((primenumber % num) == 0):
        print(num)
        count += 1

print('-----')

if count == 0:
    print(primenumber, 'is a prime number!')
else:
    print(primenumber, 'is NOT a prime number')
    
print()
input('Press <Enter> or <Return> to exit.')
    
