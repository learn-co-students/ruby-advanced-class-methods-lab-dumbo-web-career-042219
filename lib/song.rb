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
    song=Song.new
    song.save
    song
  end

  def self.new_by_name(name)
   # instantiates a song with a name property (FAILED - 1)
   song=self.new
   # @name=song_name
   song.name =name
   # song.save
   song
  end

  def self.create_by_name(name)
   # instantiates and saves a song with a name property (FAILED - 2)
   song= self.create
   song.name=name
   song
 end

 def self.find_by_name(name)
   # can find a song present in @@all by name (FAILED - 3)
   # returns falsey when a song name is not present in @@all (FAILED - 4)
   @@all.find{|song| song.name == name}
 end


 def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) ||  self.create_by_name(song_name)
 end

 def self.alphabetical
   # returns all the song instances in alphabetical order by song name (FAILED - 8)
   self.all.sort_by {|song| song.name}
 end

 def self.new_from_filename(file)
   # initializes a song and artist_name based on the filename format (FAILED - 9)
    songs=file.split(" - ")
     artist_name=songs[0]
     song_name =songs[1].gsub(".mp3", "")

     song=self.new
     song.name= song_name
     song.artist_name= artist_name
     song
 end

  def self.create_from_filename(file)
   # initializes and saves a song and artist_name based on the filename format (FAILED - 10)
   songs=file.split(" - ")
    artist_name=songs[0]
    song_name =songs[1].gsub(".mp3", "")

    song=self.create
    song.name= song_name
    song.artist_name= artist_name
    song
  end

  def self.destroy_all
   # clears all the song instances from the @@all array (FAILED - 11)
   self.all.clear
 end
end
