require 'rspec'
require_relative '../classes/games/author'
require_relative '../classes/item'

describe Author do
  context 'It should create author and add to items' do
    author = Author.new('racha', 'oba')

    it 'Creates a new author with the given parameters' do
      expect(author).to be_an_instance_of Author
    end

    it 'Should return array of items' do
      expect(author.items).to be_an_instance_of Array
    end

    it 'Return correct first name' do
      expect(author.first_name).to eq 'racha'
    end

    it 'Return correct last name' do
      expect(author.last_name).to eq 'oba'
    end
  end
end
