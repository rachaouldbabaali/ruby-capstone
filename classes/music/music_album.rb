require '../item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :publish_date, :genre

  def initialize(name, publish_date, id, archived, genre, on_spotify = false)
    super(id, publish_date, archived)
    @name = name
    @on_spotify = on_spotify
    @genre = genre
  end

end
