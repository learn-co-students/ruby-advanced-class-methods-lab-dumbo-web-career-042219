require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
      self.all.sort_by {|song| song.name.downcase}
  end

  def self.new_from_filename(file)
      split = file.split("-")
      separate = split.map(&:strip)
      artist = separate[0]
      title = separate[1].gsub(".mp3", "")
      song = self.new
      song.artist_name = artist
      song.name = title
      song
  end

  def self.create_from_filename(file)
    split = file.split("-")
    separate = split.map(&:strip)
    artist = separate[0]
    title = separate[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = artist
    song.name = title
    song.save
    song
  end

  def self.destroy_all
    self.all.clear    # clears all the song instances from the @@all array (FAILED - 12)
  end

end
