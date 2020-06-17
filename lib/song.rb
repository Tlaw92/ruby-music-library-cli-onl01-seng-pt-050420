class Song 
  
  extend Concerns::Creatable
  
  @@all = []
  
  attr_accessor :name  
  
  def initialize(name, artist=nil, genre=nil)
    if artist
      raise "artist argument must be instance of artist class" unless artist.class == Artist
      self.artist = artist
    end   
    if genre
      raise "Genre object must be instance of genre class" unless genre.class == Genre
      self.genre = genre
    end   
    @name = name 
    save
    self
  end   

  def self.all 
    @@all 
  end  
  
  def self.all=(array)
    @@all = array  
  end 
  
  def self.destroy_all
    self.all = []
  end  
  
  def save
    Song.all << self 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.index(self)
  end 
  
  def artist
    @artist
  end   
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.index(self)
  end 
  
  def genre
    @genre
  end 
  

    
    
  
   
end 