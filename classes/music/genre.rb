class Genre
  attr_accessor :items
  attr_reader :id

  def intialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
