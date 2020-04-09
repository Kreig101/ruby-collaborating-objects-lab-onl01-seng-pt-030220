require 'pry'

class Song

attr_accessor :name, :artist


@@all = []
  
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  
  def self.all
   @@all 
  end
  
  def self.new_by_filename(song)
    names = song.chomp(".mp3").split(" - ")
    artists = names[0]
    song_name = names[1]
    artists_name = Artist.new(artists)
    song_name_final  =  Song.new(song_name)
    song_name_final.artist = artists_name
    song_name_final
    
    # binding.pry
  end
  
  def artist_name=(name)
     found = Artist.find_or_create_by_name(name)
     
        song = self 
        song.artist = found
        
        found.add_song(song)
    
        
  end
 
  
end