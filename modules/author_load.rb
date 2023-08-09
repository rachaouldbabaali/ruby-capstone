require 'json'

module LoadAuthor
  def store_authors
    author_arr = []
    @authors.each do |author|
      author_arr <<
        {
          first_name: author.name,
          last_name: author.last_name,
          Games: author.items.map do |item|
                   {
                     name: item.multiplayer,
                     last_played_at: item.last_played_at,
                     publish_date: item.publish_date
                   }
                 end
        }
    end
    write_json(author_arr, '/author.json')
  end

  def load_author
    @authors = []
    author_file = './author.json'
    if File.exist?(author_file)
      file = File.read(author_file)
      JSON
        .parse(file)
        .each do |author|
          @authors << person = create_author(author['first_name'], author['last_name'])
          author['Games'].each do |games|
            person.add_item(game(games['publish_date'], games['name'],
                                 games['last_played_at']))
          end
        end
    else
      []
    end
  end

  def write_json(array, filename)
    return unless File.exist?(filename)

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(filename, JSON.generate(array, opts))
  end
end