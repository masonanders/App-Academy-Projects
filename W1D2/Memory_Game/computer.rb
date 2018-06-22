class Computer
  attr_accessor :moves_record

  def initialize(board_size)
    @known_cards = Hash.new { |h, k| h[k] = []}
    @board_size = board_size
    @matches = []
  end

  def record_move(move)
    @known_cards[*name*] << move
  end

  def find_match
    match = nil
      @known_cards.each_key do |key|
        match = key if @known_cards[key].length == 2 && !@matches.include?(key)
      end
    match
  end

  def make_move
    match = find_match
    if match
      @known_cards[match][0]
    else
      find_valid_move
    end
  end

  def find_valid_move
    previous_moves = @known_cards.values.flatten
    move = [generate_coord, generate_coord]

    while previous_move.include?(move)
      move = [generate_coord, generate_coord]
    end

    move
  end

  def generate_coord
    rand(0...@board_size)
  end
end
