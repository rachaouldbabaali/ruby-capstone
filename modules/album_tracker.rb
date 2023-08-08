require 'json'
require_relative '../classes/music'

module AlbumTracker
  # store music album
  def store_album
    if File.exist?('albums.json')
      data = File.read('albums.json')
      albums = JSON.parse(data)
      albums << { id: id, name: name, publish_date: publish_date, on_spotify: on_spotify, archived: archived,
                  genre_id: genre.id }
      File.write('./albums.json', JSON.pretty_generate(albums))
    else
      File.write('./albums.json',
                 JSON.pretty_generate([{ id: id, name: name, publish_date: publish_date, on_spotify: on_spotify,
                                         archived: archived, genre_id: genre.id }]))
    end
  end
end