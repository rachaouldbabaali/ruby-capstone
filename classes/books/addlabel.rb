require_relative 'label'
require_relative '../save_data'

class AddLabel
  def initialize
    @savedata = SaveData.new
  end

  def add_label(labels)
    puts 'Title: '
    title = gets.chomp

    puts 'Color: '
    color = gets.chomp
    data = Label.new(title, color)
    labels.push(data)
    @savedata.write_data('labels.json', labels)
  end
end
