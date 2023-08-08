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

  # store genre file
  def store_genre
    if File.exist?('genres.json')
      data = File.read('genres.json')
      genres = JSON.parse(data)
      genres << { id: id, name: name }
      File.write('./genres.json', JSON.pretty_generate(genres))
    else
      File.write('./genres.json', JSON.pretty_generate([{ id: id, name: name }]))
    end
  end

  # load from json file
  def self.load_genres
    return unless File.exist?('genres.json')

    data = File.read('genres.json')
    genres = JSON.parse(data)
    genres.each do |genre|
      Genre.new(genre['id'], genre['name'])
    end
  end

    # load from json file
    def self.load_albums
        return unless File.exist?('albums.json')
    
        data = File.read('albums.json')
        albums = JSON.parse(data)
        albums.each do |album|
          genre_object = Genre.all.select { |genre| genre.id.to_i == album['genre_id'] }
          MusicAlbum.new(album['name'], album['publish_date'], album['id'], album['archived'], genre_object,
                         album['on_spotify'])
        end
    end
end