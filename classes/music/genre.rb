require_relative 'music_album'
require '.../modules/album_tracker'

class Genre
  include AlbumTracker
  attr_reader :id, :items
  attr_accessor :name

  def intialize(name)
    @id = Random.rand(1...1000)
    @name = name
    @items = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    "ID: #{@id} | Name: #{@name}"
  end

  def add_item(item)
    @items << item
    item.add_genre = self
  end
end
