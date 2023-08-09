require_relative '../classes/books/addbook'
require_relative '../classes/books/book'

RSpec.describe AddBook do
  describe '#add_book' do
    let(:books) { [] }
    let(:add_book_instance) { described_class.new }

    before do
      allow_any_instance_of(Object).to receive(:puts)
      allow(add_book_instance).to receive(:gets).and_return('Hardcover', 'Example Publisher', '2023-08-09')
      allow_any_instance_of(SaveData).to receive(:write_data)
    end

    it 'adds a book to the list' do
      add_book_instance.add_book(books)
      expect(books.length).to eq(1)
    end

    it 'creates a Book object with the provided data' do
      add_book_instance.add_book(books)
      expect(books.first).to be_a(Book)
      expect(books.first.cover_state).to eq('Hardcover')
      expect(books.first.publisher).to eq('Example Publisher')
      expect(books.first.publish_date).to eq('2023-08-09')
    end

    it 'calls write_data method with correct arguments' do
      expect_any_instance_of(SaveData).to receive(:write_data).with('books.json', books)
      add_book_instance.add_book(books)
    end
  end
end
