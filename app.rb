require_relative 'classes/books/addbook'
require_relative 'classes/list'
require_relative 'classes/save_data'
require_relative 'classes/books/addlabel'
require_relative 'modules/prompt'
require_relative 'classes/music/music_album'
require_relative 'classes/music/genre'
require_relative 'classes/music/album_library'
require_relative 'modules/album_tracker'
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

  def app_navigator(option)
    case option
    when '1'
      books_navigator
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

  def books_navigator
    add_book = AddBook.new
    display = List.new
    addlabel = AddLabel.new
    options = {
      1 => -> { display.list_all_books },
      2 => -> { display.list_all_labels },
      3 => -> { add_book.add_book(@books) },
      4 => -> { addlabel.add_label(@labels) },
      5 => method(:run)
    }

    executer(options)
  end

  def executer(options)
    loop do
      book_prompt
      user_option = gets.chomp.to_i

      if options.key?(user_option)
        options[user_option].call
      elsif user_option == 6
        puts 'Thank you for using this app'
      else
        puts 'Invalid Selection'
      end

      break if [6, 5].include?(user_option)
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
end
