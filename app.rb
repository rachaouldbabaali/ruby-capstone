require_relative 'modules/prompt'
require_relative 'classes/music/music_album'
require_relative 'classes/music/genre'
require_relative 'classes/music/album_library'
require_relative 'modules/games_options'

class App
  include Prompt
  include Gameoptions

  def initialize
    puts 'Start cataloging your things'
    AlbumTracker.load_genres
    AlbumTracker.load_albums
    load_author
  end

  def app_navigator(option)
    case option
    when '1'
      puts 'You are in the books catalog'
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

  def books_navigator(option)
    case option
    when '1'
      'list all books'
    when '4'
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
      list_games
      app_navigator('3')
    when '2'
      list_authors
      app_navigator('3')
    when '3'
      create_game
      app_navigator('3')
    when '4'
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
