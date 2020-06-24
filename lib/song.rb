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
    #instance created
    song.name = name
    #call name method on the instance and setter method
    #name to equal the argument name
    song
    #return the instance
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    #calls on the #save method to shovel the song
    #instance with the name changed into @@all
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    split = file.split("-")
    separate = split.map(&:strip)
    artist = separate[0]
    subbed_song = separate[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = artist
    song.name = subbed_song
    song
  end

  def self.create_from_filename(file)
    split = file.split("-")
    separate = split.map(&:strip)
    artist = separate[0]
    subbed_song = separate[1].gsub(".mp3", "")
    song = self.new
    song.artist_name = artist
    song.name = subbed_song
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
