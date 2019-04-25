class Song
  attr_accessor :name, :artist_name, :new_song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  song = Song.new
  song.save
  song
  end

  def self.new_by_name(song_name)
  song = self.new
  song.name = song_name
  song
  end

   def self.create_by_name(song_name)
  song = self.new
  song.name = song_name
  song.save
  song
  end

  def self.find_by_name(song_name)
  self.all.find do |song|
  song.name == song_name
  end
end

  def self.find_or_create_by_name(song_name)
  	create_by_name(song_name)
  	find_by_name(song_name)
  end

  def self.alphabetical
  	@@all.sort_by { |name| name.name }
  end

  def self.new_from_filename(filename)
  components = filename.split( " - " )
  artist_name = components[0]
  song_name = components[1].gsub(".mp3", "")
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

  def self.create_from_filename(filename)
  components = filename.split( " - " )
  artist_name = components[0]
  song_name = components[1].gsub(".mp3", "")
  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
  end

  def self.destroy_all
  @@all = []
  end

end