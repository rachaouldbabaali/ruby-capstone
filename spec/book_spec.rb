require_relative '../classes/books/book'
require_relative '../classes/item'

describe Book do
  let(:book) { Book.new('Tumaini', 'Maganiko', '2020/08/08') }

  describe '#cover_state' do
    it 'returns the correct cover state' do
      expect(book.cover_state).to eq('Tumaini')
    end
  end

  describe '#publisher' do
    it 'returns the correct publisher' do
      expect(book.publisher).to eq('Maganiko')
    end
  end

  describe '#publish_date' do
    it 'returns the correct publish date' do
      expect(book.publish_date).to eq('2020/08/08')
    end
  end

  describe '#to_hash' do
    it 'returns a hash with cover_state, publisher, and publish_date' do
      expected_hash = {
        cover_state: 'good',
        publisher: 'Example Publisher',
        publish_date: '2023-08-09'
      }
      book = Book.new('good', 'Example Publisher', '2023-08-09')
      expect(book.to_hash).to eq(expected_hash)
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'returns false' do
        book = Book.new('bad', 'Maganiko', '2020/08/08')
        expect(book.can_be_archived?).to be_truthy
      end
    end
  end
end
