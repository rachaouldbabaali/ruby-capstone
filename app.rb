require_relative 'classes/books/addbook'
require_relative 'classes/list'
require_relative 'classes/save_data'
require_relative 'classes/books/addlabel'

class App
  attr_accessor :books

  def initialize
    @save_data = SaveData.new
    @books = @save_data.read_data('books.json')
    @labels = @save_data.read_data('labels.json')
  end

  def menu
    puts '1 - List all Books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
    puts "6 - List all labels (e.g. 'Gift', 'New')"
    puts "7 - List all authors (e.g. 'Stephen King')"
    puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Add a label'
    puts '14 - Exit applicattion'
  end

  def run(options)
    loop do
      menu
      user_option = gets.chomp.to_i

      if options.key?(user_option)
        options[user_option].call
      else
        puts 'Invalid Selection'
      end

      break if user_option == 14
    end
  end

  def application
    add_book = AddBook.new
    display = List.new
    addlabel = AddLabel.new

    options = {
      6 => -> { display.list_all_labels },
      9 => -> { add_book.add_book(@books) },
      1 => -> { display.list_all_books },
      13 => -> { addlabel.add_label(@labels) }
    }

    run(options)
  end
end
