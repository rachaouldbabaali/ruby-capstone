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
end
