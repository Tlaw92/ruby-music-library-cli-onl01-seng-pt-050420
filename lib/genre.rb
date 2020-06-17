class Genre 
  
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
    Genre.all << self 
  end 
  
  def songs
    @songs
  end  
  
    def artists 
    artist_objects = songs.map do |song| 
      song.artist
    end  
    artist_objects.uniq
  end

   
end 