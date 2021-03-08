require_relative "room"

class Hotel
  
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |room, cap|
        @rooms[room] = Room.new(cap)
    end
  end

  def name
    temp_arr = @name.split(" ")
    cap_arr = []
    temp_arr.each { |str| cap_arr << str.capitalize }
    cap_arr.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    if @rooms.has_key?(room_name)
        return true
    end
    false
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        puts "sorry, room does not exist"
    else
        if @rooms[room_name].add_occupant(person)
            puts "check in successful"
        else
            puts "sorry, room is full"
        end
    end
  end

  def has_vacancy?
    @rooms.each do |room_name, room|
        if !room.full?
            return true
        end
    end
    false
  end

  def list_rooms
    @rooms.each do |room_name, room|
        puts room_name + ": " + room.available_space.to_s 
    end
  end



end
