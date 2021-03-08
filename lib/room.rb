class Room

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    if @occupants.size < @capacity
        return false
    end
    true
  end

  def available_space
    @capacity - @occupants.size
  end

  def add_occupant(string) 
    if full?
        return false
    end
    @occupants << string
    true
  end

end
