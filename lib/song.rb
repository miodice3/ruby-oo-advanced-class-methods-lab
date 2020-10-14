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
    song = Song.new
    @@all << song
    return song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
  song = self.new_by_name(name)
  @@all << song
  song
  #binding.pry
  end

  def self.find_by_name(name)
      self.all.each do |song_instance|
        #binding.pry
         if song_instance.name == name 
           return song_instance
         else
         end
      end
      return nil
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song 
      return found_song
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(string)
    array = string.delete_suffix('.mp3').split(" - ")
    song = Song.new
    song.name=(array[1])
    song.artist_name=(array[0])
    song
  end

  def self.create_from_filename(string)
    array = string.delete_suffix('.mp3').split(" - ")
    song = Song.new
    song.name=(array[1])
    song.artist_name=(array[0])
    @@all << song
    song
  end

  def self.destroy_all
    #@@all = @@all.clear
    self.all.clear   #both of these work
  end

end
