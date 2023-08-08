require_relative '../item'
require_relative 'genre'
require_relative '../../modules/album_tracker'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify, :publish_date, :genre

  def initialize(name, publish_date, id, archived, genre, on_spotify = false)
    super(id, publish_date, archived)
    @name = name
    @on_spotify = on_spotify
    @genre = genre
  end

  # Returns all music albums 
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "Album name : #{@name} ~ Published on : #{@publish_date} / #{if @on_spotify
                                                                   'Available on spotify'
                                                                 else
                                                                   'Not available on spotify'
                                                                 end}"
  end

end
