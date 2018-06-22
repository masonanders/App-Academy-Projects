require "byebug"

require_relative "player"

class Game
  attr_accessor :dictionary
  def initialize
    @player = get_player#, get_player
    @fragment = ""
    @dictionary = import_dictionary
    # @current_player = @players[0]
  end

  def play
    until over?
      play_round
    end
  end

  def play_round
    take_turn

    next_player!

    over?
  end

  def next_player!
  end

  def take_turn
    until valid_play?(@current_player.guess)
      @current_player.alert_invalid_guess
    end
    @fragment += guess
  end

  def valid_play?(string)

    alphabet = ("a".."z").to_a
    return false unless alphabet.include?(string)

    future_frag = @fragment + string
    potential_words = @dictionary.keys.select{|word| word[0,future_frag.length] == future_frag}
    potential_words.length > 0 ? true : false
  end

  def get_player
    @player = Player.new
  end

  def import_dictionary
    dictionary = Hash.new
    f = File.new("dictionary.txt")
    f.each do |word|
      dictionary[word.chop] = true
    end
    dictionary
  end
end
