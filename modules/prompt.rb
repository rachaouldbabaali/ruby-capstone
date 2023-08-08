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
end
