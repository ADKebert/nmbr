# Need to find a way to generate random numbers
# Need to create a reusably prompt for a guess
# Need to evaluate the user's guess against our random numbers
# Need to display an appropriate message after evaluating
# Need to either reprompt, announce victory, or announce defeat

# Let's get a RNG
rng = Random.new
# Now we generate a number between 1-100 and put it in our_number
our_number = rng.rand(100)
