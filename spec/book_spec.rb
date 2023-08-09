require_relative '../classes/item'
require_relative '../classes/books/book'

RSpec.describe Book do
  let(:book) { Book.new('good', 'Example Publisher') }

  describe '#initialize' do
    it 'sets cover_state and publisher' do
      expect(book.cover_state).to eq('good')
      expect(book.publisher).to eq('Example Publisher')
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is bad' do
      it 'returns true' do
        book.cover_state = 'bad'
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when cover_state is not bad' do
      it 'returns false' do
        book.cover_state = 'good'
        expect(book.can_be_archived?).to be false
      end
    end
  end

  describe '#to_hash' do
    it 'returns a hash with cover_state and publisher' do
      expected_hash = {
        cover_state: 'good',
        publisher: 'Example Publisher'
      }
      expect(book.to_hash).to eq(expected_hash)
    end
  end
end
