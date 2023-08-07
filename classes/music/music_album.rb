require '../item.rb'

class MusicAlbum < Item
  def initialize(on_spotify: false)
    @on_spotify = on_spotify
  end
end
