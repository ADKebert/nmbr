# Time to restructure the code for Hard Mode so that it
# is in class Game
# Should set the number to be guessed in initialize
# Must Evaluate the quality of the user's guess to see
# if it helps them.  To do this I will track their previous guess
# and I will compare the new guess with respect to the
# higher or lower message
require_relative 'humangame'
require_relative 'computergame'

puts "Who should do the guessing?"
puts "Type \"me\" or \"computer\""
if gets.chomp == "me"
  HumanGame.new.play
else
  ComputerGame.new.play
end

# Math mode: correctly guessing a number within a range is basically doing a search
# on a sorted list.  I personally know of binary search as a solid algorithm for
# searching a sorted list and it is an O(log n) algorithm.  It's easy to see that binary
# search cuts the remaining values in half with each pass so if represented as a tree
# it will have 2 branchers per node and should find the answer within log base 2 of n.  After
# googling the change of base formula I find that log 2 of 1 billion rounds up to 30.
# assuming my math skills aren't super rusty, 30 searches will find the target in
# 1 billion, which I still find very impressive. Trying the same thing on our range of 1-100
# the log rounds up to 7, which is the number I found that always got the right answer
# when starting the guess at 50, so I feel good about my answer of 30
