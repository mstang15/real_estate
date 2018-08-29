class Room
  attr_reader :category, :area
  def initialize(category, width, length)
    @category = category
    @area = width * length
  end
end
