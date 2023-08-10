require_relative 'classes/books/addbook'
require_relative 'classes/list'
require_relative 'classes/save_data'
require_relative 'classes/books/addlabel'
require_relative 'modules/prompt'
require_relative 'classes/music/music_album'
require_relative 'classes/music/genre'
require_relative 'classes/music/album_library'
require_relative 'modules/album_tracker'
require_relative 'classes/games/add_game'
require_relative 'classes/games/author' # Make sure to include the Author class definition here
require_relative 'classes/games/list_games'
require_relative 'classes/games/list_authors'
require_relative 'classes/games/list_data'
require_relative 'classes/games/author_data'
require_relative 'classes/games/game_data'
require_relative 'classes/games/add_item'

class App
  attr_accessor :books

  include Prompt

  attr_reader :authors, :games

  def initialize
    puts 'Start cataloging your things'
    AlbumTracker.load_genres
    AlbumTracker.load_albums

    @authors = AuthorData.read_data
    @games = GameData.read_data

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
      games_prompt
      games_navigator(gets.chomp)
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
      ListGames.new.list_items(@games)
      app_navigator('3')
    when '2'
      ListAuthors.new.list_authors(@authors)
      app_navigator('3')
    when '3'
      add_game
      app_navigator('3')
    when '4'
      run
    else
      puts 'That is not a valid option'
    end
  end

  def add_game
    print 'Enter game name: '
    game_name = gets.chomp

    print 'Is it a multiplayer game? [Y/N] '
    multiplayer = answer_yes?

    print 'When was the game published? (YYYY-MM-DD) '
    publish_date = gets.chomp

    print 'When was the last time it was played? (YYYY-MM-DD) '
    last_played_at = gets.chomp

    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors << author
    AuthorData.save_data(authors)

    game = Game.new(generate_game_id, game_name, multiplayer, publish_date, last_played_at)
    game.author = author if author # Assign the author to the game
    @games << game
    GameData.save_data(games)

    puts 'Game added successfully!'
  end

  def generate_game_id
    @games.empty? ? 1 : @games.last.id + 1
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  def add_author
    print 'Enter author first name: '
    first_name = gets.chomp
    print 'Enter author last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors << author
    AuthorData.save_data(authors)

    puts 'Author added successfully!'
    author # Return the created author
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
