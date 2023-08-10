require_relative '../classes/books/label'
require_relative '../classes/item'
describe Label do
  context 'I create the author object and test it' do
    let(:label) { Label.new('Money', 'Red') }
    let(:item) { Item.new('2022-12-31') }
    it 'Title must be Money' do
      expect(label.title).to eq('Money')
    end
    it 'Color must be Red' do
      expect(label.color).to eq('Red')
    end
    it 'sets the item author to the current author' do
      label.add_item(item)
      expect(item.label).to eq(label)
    end

    it 'returns a hash with cover_state, publisher, and publish_date' do
      expected_hash = {
        title: 'hope',
        color: 'Red'
      }
      book = Label.new('hope', 'Red')
      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
