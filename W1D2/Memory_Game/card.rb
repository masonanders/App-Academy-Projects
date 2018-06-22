class Card
  attr_accessor :name, :face_up, :asdf

  def initialize(name)
    @name = name
    @face_up = false
    @asdf = status
  end

  def status
    @face_up ? @name : "_"
  end

  def reveal
    @face_up = true
    @asdf = status
  end

  def hide
    @face_up = false
    @asdf = status
  end
end
