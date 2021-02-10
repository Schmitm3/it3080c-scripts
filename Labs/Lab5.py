print("Please enter a number to guess...")

number = 7
numberGuess=int(input())

while numberGuess != number:
    if numberGuess > number:
        print("Your number is too high, please try again...")
        numberGuess=int(input())
    else:
        print("Your number is too low, please try again...")
        numberGuess=int(input())

print("Winner!")