require_relative 'classes/books/addbook'
require_relative 'classes/list'
require_relative 'classes/save_data'
require_relative 'classes/books/addlabel'
require_relative 'modules/prompt'
require_relative 'classes/music/music_album'
require_relative 'classes/music/genre'
require_relative 'classes/music/album_library'

class App
  attr_accessor :books

  include Prompt

  def initialize
    puts 'Start cataloging your things'
    AlbumTracker.load_genres
    AlbumTracker.load_albums
    @save_data = SaveData.new
    @books = @save_data.read_data('books.json')
    @labels = @save_data.read_data('labels.json')
  end

  # def menu
  #   puts '1 - List all Books'
  #   puts '2 - List all music albums'
  #   puts '3 - List all movies'
  #   puts '4 - List of games'
  #   puts "5 - List all genres (e.g 'Comedy', 'Thriller')"
  #   puts "6 - List all labels (e.g. 'Gift', 'New')"
  #   puts "7 - List all authors (e.g. 'Stephen King')"
  #   puts "8 - List all sources (e.g. 'From a friend', 'Online shop')"
  #   puts '9 - Add a book'
  #   puts '10 - Add a music album'
  #   puts '11 - Add a movie'
  #   puts '12 - Add a game'
  #   puts '13 - Add a label'
  #   puts '14 - Exit applicattion'
  # end

  # def exucuter(options)
  #   loop do
  #     menu
  #     user_option = gets.chomp.to_i

  #     if options.key?(user_option)
  #       options[user_option].call
  #     else
  #       puts 'Invalid Selection'
  #     end

  #     break if user_option == 14
  #   end
  # end

  def app_navigator(option)
    case option
    when '1'
      book_prompt
      books_navigator(gets.chomp)
    when '2'
      music_albums_prompt
      music_albums_navigator(gets.chomp)
    when '3'
      puts 'You are in the games catalog'
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def books_navigator(option)
    add_book = AddBook.new
    display = List.new
    addlabel = AddLabel.new
    case option
    when '1'
      display.list_all_labels
    when '2'
      add_book.add_book(@books)
    when '3'
      display.list_all_books
    when '4'
      addlabel.add_label(@labels)
    when '5'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def music_albums_navigator(option)
    case option
    when '1'
      AlbumLibrary.list_music_albums
      app_navigator('2')
    when '2'
      AlbumLibrary.list_genres
      app_navigator('2')
    when '3'
      AlbumLibrary.add_music_album
      app_navigator('2')
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def games_navigator(option)
    case option
    when '1'
      'list all games'
    when '2'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def run
    app_prompt
    option = gets.chomp
    if option == '4'
      puts 'Thank you for using this app'
      exit
    end
    app_navigator(option)
  end

  # def application
  #   add_book = AddBook.new
  #   display = List.new
  #   addlabel = AddLabel.new

  #   options = {
  #     6 => -> { display.list_all_labels },
  #     9 => -> { add_book.add_book(@books) },
  #     1 => -> { display.list_all_books },
  #     13 => -> { addlabel.add_label(@labels) }
  #   }

  #   exucuter(options)
  # end
end
