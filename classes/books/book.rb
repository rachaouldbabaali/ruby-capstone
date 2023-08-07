require '../item'

class Book < Item
  def initialize(cover_state, publisher)
    super()
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    can_be_archived || cover_state == 'bad'
  end
end
