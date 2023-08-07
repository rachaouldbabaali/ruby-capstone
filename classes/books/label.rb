class Label
  attr_reader :id
  attr_accessor :items

  def initialize(title, color)
    @id = Random.rand(i..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
