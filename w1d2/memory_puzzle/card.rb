class Card

  attr_reader :face_value
  attr_accessor :face_up

  def initialize(face_value, face_up = false)
    @face_value = face_value
    @face_up = face_up
  end

  def display
    return face_value if face_up
    nil
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    "#{face_value}"
  end

  def ==(other_card)
    return true if self.face_value == other_card.face_value
    false
  end

end
