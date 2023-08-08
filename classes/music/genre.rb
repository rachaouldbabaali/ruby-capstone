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

  def add_item(item)
    @items << item
  end
end
