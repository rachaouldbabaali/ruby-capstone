module Prompt
  def app_prompt
    puts
    puts 'Please choose an option by entering a number: '
    puts '1 - books catalog'
    puts '2 - music albums catalog'
    puts '3 - games catalog'
    puts '4 - Exit'
  end

  def music_albums_prompt
    puts
    puts 'Music Albums catalog'
    puts '1 - List all music albums'
    puts '2 - List all genres'
    puts '3 - Add a music album'
    puts '4 - Back'
  end

  def games_prompt
    puts
    puts 'Games catalog'
    puts '1 - List all games'
    puts '2 - List all authors'
    puts '3 - Add a game'
    puts '4 - Back'
  end
  
  def book_prompt
    puts '1 - List all Books'
    puts "2 - List all labels (e.g. 'Gift', 'New')"
    puts '3 - Add a book'
    puts '4 - Add a label'
    puts '5 - Back'
    puts '6 - Exit applicattion'
  end
end
