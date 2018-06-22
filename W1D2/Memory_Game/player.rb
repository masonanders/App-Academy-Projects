class Player
  def initialize
  end

  def get_move
    puts "Choose a card!"
    puts "Example: 1,2"
    move = gets.chomp
    move = move.split(",")
    move.map { |num| num.to_i }
  end
end
