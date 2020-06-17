class Artist 
  
  extend Concerns::Creatable
  
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name 
    save
    @songs = []
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
    Artist.all << self 
  end   
  
  def songs
    @songs
  end   
  
  def add_song(song)
    self.songs << song unless songs.index(song)
    song.artist = self unless song.artist 
  end   
  
  def genres 
    genre_types = songs.map do |song| 
      song.genre 
    end  
    genre_types.uniq
  end 
  
end 