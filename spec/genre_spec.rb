require_relative '../classes/item'
require_relative '../classes/music/genre'
require_relative '../classes/music/album_library'

describe Genre do
  before :each do
    @genre = Genre.new('1', 'Pop')
  end

  it 'contain a name' do
    expect(@genre.name).to eq('Pop')
  end

  it 'has items' do
    expect(@genre.items).to eq([])
  end
end