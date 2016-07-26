# Need to find a way to generate random numbers
# Need to create a reusable prompt for a guess
# Need to evaluate the user's guess against our random numbers
# Need to display an appropriate message after evaluating
# Need to either reprompt, announce victory, or announce defeat

# Adventure Mode! now I must keep track of previous
# guesses so that I can compare new ones

def prompt_for_guess
  print "Please guess a number: "
  guess = gets.chomp.to_i
end

def evaluate_guess(guess, our_number)
  guess <=> our_number
end

# Let's get a RNG
rng = Random.new
# Now we generate a number between 1-100 and put it in our_number
our_number = rng.rand(100)

# Let's announce the rules and establish a guess counter
puts "Try to guess my number.  It is between 1 and 100"
count = 0

# I'll add an array to store the guesses
guesses = []

# Time to begin guessing
loop do
  # I need to use the guess in two places now so I will
  # stick it in a variable
  guess = prompt_for_guess
  guesses << guess
  if guesses.count(guess) > 1
    puts "That's still not right!"
  end
  result = evaluate_guess(guess, our_number)
  # I'll check for victory first because it can stop the loop earliest
  if result == 0
    puts "Victory!"
    break
  elsif result == -1
    puts "Higher!"
  else
    puts "Lower!"
  end
  count += 1
  # Once count == 5 the user has lost
  if count == 5
    puts "You Lose :("
    break
  end
end
