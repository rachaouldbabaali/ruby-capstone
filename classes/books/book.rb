require_relative '../item'

class Book < Item
  attr_accessor :cover_state, :publisher

  def initialize(cover_state, publisher, publish_date)
    super(publish_date)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    @can_be_archived || @cover_state == 'bad'
  end

  def to_hash
    {
      cover_state: @cover_state,
      publisher: @publisher,
      publish_date: @publish_date
    }
  end
end
