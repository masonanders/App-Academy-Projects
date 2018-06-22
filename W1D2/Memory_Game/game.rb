class Game
  attr_reader :previous_guess

  def initialize()
    @board = Board.new
    @player = get_player
    # @turns = 0
    @previous_guess = nil
  end

  def get_player
    p "Is the player a human?"
    p "Enter y or n"
    input = gets.chop.downcase
    @player = input == "y" ? Player.new : Computer.new
  end

  def play
    system("clear")
    @board.render
    until @board.won?
      move = @player.get_move
      until valid_move?(move)
        puts "Invalid move."
        move = @player.get_move
      end
      @board.reveal(move)
      system("clear")
      @board.render
      if @previous_guess == nil
        @previous_guess = move
      elsif match?(move)
        @previous_guess = nil
      else
        timer(2)
        @board.grid[move[0]][move[1]].hide
        @board.grid[@previous_guess[0]][@previous_guess[1]].hide
        @previous_guess = nil
        system("clear")
        @board.render
      end
    end
    p "Congratulations! You have matched all the letters."
  end

  def timer(seconds)
    seconds = seconds
    while seconds > 0
      puts seconds
      sleep(1)
      seconds -= 1
    end
  end

  def valid_move?(move)
    return false if move == previous_guess
    return false if move.any? { |num| num >= @board.size }
    return false unless move.length == 2
    return false if @board.grid[move[0]][move[1]].face_up
    true
  end

  def match?(move)
    @board.card_name(move) == @board.card_name(@previous_guess)
  end


end
