require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # #
  # def initialize
  #   @name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song  # need to return song
  end

  def self.create_by_name(name)
    # song = self.new
    # song.name = name
    # self.all << song
    # song  # need to return song
    song = self.create
    song.name = name
    song   #pay attention to return song
  end

  def self.find_by_name(name)

    self.all.find {|s| s.name == name}

    # self.all.find do |song|
    #   if song.name == name
    #   song.name
    #   else
    #   false
    #   end
    # end
  end

  def self.find_or_create_by_name(name)

    # if self.find_by_name(name).nil?
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end

    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

  def self.new_from_filename(filename)
    # parse for song_name  <Artist Name> - <Song Name>.mp3
    # artist_name = filename.split(' - ')[0]
    # song_name = filename.split(' - ')[1].split('.')[0]

    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
     parts = filename.split(" - ")
     artist_name = parts[0]
     song_name = parts[1].gsub(".mp3", "")

     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
 end

  def self.destroy_all
    self.all.clear
  end

end
