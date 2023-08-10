class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @items = []
    @id = Random.rand(1...1000)
  end

  def add_items(given_item)
    @items << given_item
    given_item.author(self)
  end
end
