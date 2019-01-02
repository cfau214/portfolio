def main():
    startup_message()

    #Step one
    input()
    step_one()
    input('Press enter to continue to step 2.')

    #Step two
    step_two()
    input('Press enter to continue to step 3.')

    #Step three
    step_three()
    input('Press enter to continue to step 4.')

    #Step four
    step_four()
    input('Press enter to continue...')

    #End program message
    ending_message()

def startup_message():
    print('When ready to begin, please hit enter.')

def ending_message():
    print('Process finished. Re-run program if any problems.')

def step_one():
    print('Step 1: ')
    print('Unplug the dryer and move it away from the wall.\n')

def step_two():
    print('\nStep 2: ')
    print('Remove the six screws from the back of the dryer.\n')

def step_three():
    print('\nStep 3: ')
    print("Remove the dryer's back panel.\n")

def step_four():
    print('\nStep 4: ')
    print('Pull the top of the dryer straight up.')


main()
input()
