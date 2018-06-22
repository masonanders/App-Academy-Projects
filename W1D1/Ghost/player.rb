class Player
  def initialize
    @name = get_name
  end

  def get_name
    puts "Enter your name!"
    name = gets.chop
  end

  def guess
    puts "Enter a guess!"
    guess = gets.chop
  end

  def alert_invalid_guess
    puts "Not a valid letter!"
    puts "Try again..."
  end
end
