require '../item.rb'

class Book < Item
  def initialize(cover_state, publisher)
    @cover_state = cover_state
    @publisher = publisher
  end
end
