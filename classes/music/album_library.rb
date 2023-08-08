require_relative 'music_album'
require_relative 'genre'
require_relative '../../modules/album_tracker'

class AlbumLibrary
  include AlbumTracker

  def self.list_music_albums
    puts 'No Music album found in the catalog' if MusicAlbum.all.empty?
    MusicAlbum.all.each_with_index do |album, i|
      puts "#{i + 1}) Name: #{album.name} || published on #{album.publish_date} || Is on spotify? = #{album.on_spotify}"
    end
  end

  # create a music album
  def self.add_music_album
    print 'Album Name : '
    name = gets.chomp
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp
    print 'Is it on spotify? [y/n]: '
    spotify = gets.chomp
    spotify = spotify == 'y'
    genre = AlbumLibrary.add_genre
    my_album = MusicAlbum.new(name, publish_date, nil, false, genre, spotify)
    my_album.store_album
    puts 'Music album added successfully!!'
  end

  # Add genre
  def self.add_genre
    print 'Genre Name : '
    name = gets.chomp
    my_genre = Genre.new(nil, name)
    my_genre.store_genre
    puts 'Genre added successfully!!'
    my_genre
  end

  # listing genre
  def self.list_genres
    if Genre.all.empty?
      puts 'No genre in the catalog'
      return
    end
    puts
    Genre.all.each do |genre|
      puts genre
      puts
    end
  end
end
