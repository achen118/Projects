class Tile

  def initialize(has_mine = false)
    @has_mine = has_mine
    @revealed = false
    @flagged = false
  end

  def has_mine?
    @has_mine
  end

  def revealed?
    @revealed
  end

  def reveal
    @revealed = true
  end

  def flagged?
    @flagged
  end

  def flag
    @flagged = true
  end

  def to_s
    return "F" if flagged?
    return "-" unless revealed?
    return "M" if has_mine?
    " "
  end
end
