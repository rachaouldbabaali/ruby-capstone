require_relative 'author'

class AddItem
  def make_item(item_type)
    puts "Creating a new #{item_type}...\n\n"

    print 'What date was it published on? (YYYY-MM-DD) '
    gets.chomp
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  def add?(something)
    puts
    print "Would you like to add #{something}? [Y/N] "
    answer_yes?
  end

  def more(item, app)
    print 'Would you like to add more details? [Y/N] '
    return unless answer_yes?

    more_author(item, app.authors) if add?('an author')
  end

  def more_author(item, authors)
    puts "What is the author's first name? "
    first_name = gets.chomp
    puts "What is the author's last name? "
    last_name = gets.chomp

    author = authors.find { |auth| auth.first_name == first_name && auth.last_name == last_name }
    if author
      item.add_author(author)
    else
      author = Author.new(first_name, last_name)
      item.add_author(author)
      authors << author
    end
  end
end
