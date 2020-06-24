class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
    @artist_name = nil
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
  end

  def self.find_by_name(string)
    self.all.find {|ele| string == ele.name}
  end

  def self.find_or_create_by_name(string)
    song = self.find_by_name(string)
    song ? song : self.create_by_name(string)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(string)
    arr = string.split(" - ")
    song = self.new_by_name(arr[1][0...-4])
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(string)
    self.new_from_filename(string).save
  end

  def self.destroy_all
    self.all.clear
  end
end
