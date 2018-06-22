class Board
  attr_accessor :size, :grid 

  ALPHABET = ("A".."Z").to_a

  def initialize(size = 4)
    @grid = Array.new(size) { Array.new }
    @size = size
    populate_board
  end

  def populate_board
    deck = create_deck
    @grid.each do |row|
      @grid.length.times { row << deck.pop }
    end
  end

  def create_deck
    number_of_cards = @grid.length ** 2
    card_face = ALPHABET[0...(number_of_cards/2)]
    card_face += card_face
    card_face = card_face.shuffle
    deck = card_face.map { |card| Card.new(card) }
  end

  def render
    @grid.each do |row|
      arr = []
      row.length.times do |idx|
        arr << row[idx].asdf
      end
      p arr
    end
  end

  def won?
    @grid.all? do |row|
      row.all? { |card| card.face_up }
    end
  end

  def reveal(guessed_pos)
    card = @grid[guessed_pos[0]][guessed_pos[1]]
    card.reveal unless card.face_up
  end

  def card_name(move)
    card = @grid[move[0]][move[1]]
    card.name
  end




end
