require '../item'

class MusicAlbum < Item
  def initialize(on_spotify: false)
    super()
    @on_spotify = on_spotify
  end
end
