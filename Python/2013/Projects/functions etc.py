def main():
    print('This program will calculate your gross annual pay.')
    print('-------------------')
    pay = float(input('Please enter your monthly pay rate: '))
    months = float(input('Please enter how many months you would like to calculate' +
                        ' for your pay: '))
    annualpay = calculatepay(pay, months)
    print('Annual pay after returning value from calculate pay is: ', annualpay)

def calculatepay(pay, months):
    annualpay = pay * months
    print('-------------------')
    print('Gross annual pay is:', format(annualpay, ',.2f'))
    return(annualpay)

main()
print()
input('Please press <return> or <enter> to end the program.')
