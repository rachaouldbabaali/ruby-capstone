require_relative 'save_data'

class List
  def initialize
    @savedata = SaveData.new
  end

  def list_all_books
    @books_items = @savedata.read_data('books.json')
    return unless @books_items.is_a?(Array)

    @books_items.each do |book|
      if book.is_a?(Array)
        books.each { |book| puts "Cover: #{book.cover_state} Publisher: #{book.publisher}" }
      elsif book.is_a?(Hash)
        puts "Cover: #{book[:cover_state]} Publisher: #{book[:publisher]}"
      end
    end
  end

  def list_all_labels
    @label_items = @savedata.read_data('labels.json')
    return unless @label_items.is_a?(Array)

    @label_items.each do |label|
      if label.is_a?(Array)
        labels.each { |label| puts "Title: #{label.title}" }
      elsif label.is_a?(Hash)
        puts "Title: #{label[:title]}"
      end
    end
  end
end
