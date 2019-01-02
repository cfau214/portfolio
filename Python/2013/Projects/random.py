def main():
    startup_message()

    #Step one
    input()
    step_one()
    print('Press enter to continue to step 2.')
    input()

    #Step two
    step_two()
    print('Press enter to continue to step 3.')
    input()

    #Step three
    step_three()
    print('Press enter to continue to step 4.')
    input()

    #Step four
    step_four()
    print('Press enter to continue...')
    input()

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
    print('Step 2: ')
    print('Remove the six screws from the back of the dryer.\n')

def step_three():
    print('Step 3: ')
    print("Remove the dryer's back panel.\n")

def step_four():
    print('Step 4: ')
    print('Pull the top of the dryer straight up.')


main()
