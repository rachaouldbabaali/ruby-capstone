class Item
  attr_reader :id, :publish_date, :archived

  def intialize(id, publish_date, archived: false)
    @id = id || Random.rand(1...1000)
    @publish_date = publish_date || Time.at(rand * Time.now.to_i).strftime('%Y/%m/%d')
    @archived = archived
  end

  def can_be_archived?
    publish_date.year > 10
  end

  def move_to_archive!
    @archived = true if can_be_archived?
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def list_items
    all.each do |item|
      puts item.to_s
    end

    puts 'No items avaliable' if all.empty?
  end
end
