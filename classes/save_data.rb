require 'json'
require_relative 'books/book'

class SaveData
  def read_data(file_name)
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end

  def write_data(file, content)
    data = content.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file, json)
  end
end
