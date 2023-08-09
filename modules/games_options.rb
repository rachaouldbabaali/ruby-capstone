require_relative 'author_load'
require_relative '../classes/games/game'
require_relative '../classes/games/author'

# Game options module
module Gameoptions
  include LoadAuthor
  def add_new_game
    name = take_input_label('Enter the name of the game')
    last_played_at = take_input_label('Enter the date of the last played')
    publish_date = take_input_label('Enter the publish date of the game')
    game(publish_date, name, last_played_at)
  end

  def game(publish_date, name, last_played_at)
    Game.new(1, publish_date, false, name, last_played_at)
  end

  def create_game
    game = add_new_game
    choice = take_input_label('Do you want to add new author of game[1] or add existing author[2]')
    choice = choice.to_i
    case choice
    when 1
      author = add_new_author
      @authors << author.add_item(game)
      store_authors
    when 2
      author = add_existing_author
      author.add_item(game)
      store_authors
    end
  end

  def add_existing_author
    put_lable('Existing authors')
    list_authors
    id = take_input_label('Enter the id of the author')
    puts('Created successfully')
    id = id.to_i
    @authors.find { |author| author.id == id }
  end

  def add_new_author
    author_first_name = take_input_label('Enter the author first_name')
    author_last_name = take_input_label('Enter the author last name')
    create_author(author_first_name, author_last_name)
    puts('Created successfully')
  end

  def create_author(author_first_name, author_last_name)
    Author.new(author_first_name, author_last_name)
  end

  def list_authors
    put_lable('Authors')
    put_lable('ID | AuthorName')
    put_lable('------------------')
    @authors.each do |author|
      puts "#{author.id}  #{author.name} #{author.last_name}"
    end
  end

  def list_games
    puts 'Games'
    puts '     Name   |   Author'
    puts '--------------------------'
    @authors.each do |games|
      games.items.each do |game|
        puts "#{game.multiplayer}        #{game.publish_date}"
      end
    end
  end

  def put_lable(label)
    puts label.to_s
  end

  def take_input_label(label)
    print "#{label}: "
    gets.chomp
  end
end