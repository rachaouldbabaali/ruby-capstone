class Item
  attr_reader :id
  
  def intialize(id, publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date || Time.at(rand * Time.now.to_i).strftime('%Y/%m/%d')
    @archived = archived
  end

  def can_be_archived?
    true
  end

  def move_to_archive!
    @archived = true
  end
end