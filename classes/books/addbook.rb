require_relative 'book'
require_relative '../save_data'

class AddBook
  def initialize
    @savedata = SaveData.new
  end

  def add_book(books)
    puts 'Cover state: '
    cover_state = gets.chomp

    puts 'Publisher: '
    publisher = gets.chomp

    puts 'Date of publication YYYY-MM-DD'
    publish_date = gets.chomp

    data = Book.new(cover_state, publisher, publish_date)
    books.push(data)
    @savedata.write_data('books.json', books)
  end
end
