class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    if category == :bedroom
      bedroom_list
    elsif category == :basement
      basement_list
    elsif category == :living_room
      living_room_list
    else
      other_list
    end
  end

  def bedroom_list
    @rooms.find_all do |room|
      room.category == :bedroom
    end
  end

  def basement_list
    @rooms.find_all do |room|
      room.category == :basement
    end
  end

  def living_room_list
    @rooms.find_all do |room|
      room.category == :living_room
    end
  end

  def other_list
    @rooms.delete(basement_list)
    @rooms.delete(bedroom_list)
    @rooms.delete(living_room_list)
    return @rooms
  end

  def area
    area = @rooms.map do |room|
      room.area
    end.sum
  end

  def price_per_square_foot
    (@price.to_f/area).round(2)
  end

  def rooms_sorted_by_areas
    @rooms.sort_by do |room|
    room.area
    end
  end

  def rooms_by_category
    category = [{:bedroom=> bedroom_list,:living_room=>living_room_list,:basement=>basement_list}]
  end

end
