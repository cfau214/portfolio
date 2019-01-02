def main():
    print('Celsius to Fehrenheit Table')
    print(' C                   F')
    print('---------------------------')
    
    C = 0
    while (C < 21):
        F = (9/5)* C + 32
        print (C, '                 ', F)
        C += 1


    input('Press <Enter> or <Return> to close the program.')


main()
