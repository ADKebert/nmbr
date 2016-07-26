# Time to restructure the code for Hard Mode so that it
# is in class Game
# Should set the number to be guessed in initialize
# Must Evaluate the quality of the user's guess to see
# if it helps them.  To do this I will track their previous guess
# and I will compare the new guess with respect to the
# higher or lower message

class Game
  # Game needs a target number and a list of guesses
  def initialize
    @target = Random.new.rand(100)
    @guesses = []
  end

  def prompt_for_guess
    print "Please guess a number: "
    guess = gets.chomp.to_i
  end

  def evaluate_guess(guess)
    guess <=> @target
  end

  def play
    puts "Try to guess my number.  It is between 1 and 100"
    count = 0
    loop do
      guess = prompt_for_guess
      @guesses << guess
      if @guesses.count(guess) > 1
        puts "That's still not right!"
      end
      result = evaluate_guess(guess)
      if result == 0
        puts "Victory!"
        break
      elsif result == -1
        puts "Higher!"
      else
        puts "Lower!"
      end
      count += 1
      if count == 5
        puts "You Lose :("
        break
      end
    end
  end
end

Game.new.play
