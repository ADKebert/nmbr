# For Mega mode I must implement a new prompt that lets
# the user tell the computer if their guess is low or high
# I want the computer to be smart so I will use a binary search to
# determine guesses.  The computer will inform the user they are lying
# if their feedback doesn't make sense.
class ComputerGame
  def initialize
    @high = 100
    @low = 1
    @guess = Random.new.rand(100)
  end

  def make_a_guess
    @guess = (@high + @low) / 2
  end

  def prompt_for_hint
    puts "Please say if I should guess *higher* *lower* or if I am *correct*"
    hint = gets.chomp
  end

  def apply_hint(hint)
    if hint == "higher"
      @low = @guess + 1
    elsif hint == "lower"
      @high = @guess - 1
    end
  end

  def lying?
    @low > @high
  end

  def play
    puts "Ok, think of a number between 1 and 100"
    puts "Tell me \"higher\", \"lower\", or \"correct\" to indicate my guess was too low, too high, or correct respectively"
    count = 0
    loop do
      puts "My guess is #{@guess}"
      hint = prompt_for_hint
      if hint == "correct"
        puts "Hurray for me!"
        break
      else
        apply_hint(hint)
        if lying?
          puts "Preposterous! Come back when you can play fair"
          break
        end
        make_a_guess
        count += 1
      end
      if count == 5
        puts "I lose, well played"
        break
      end
    end
  end
end
