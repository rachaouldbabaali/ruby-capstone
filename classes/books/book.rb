require '../item'

class Book < Item
  def initialize(cover_state, publisher)
    super()
    @cover_state = cover_state
    @publisher = publisher
  end
end
