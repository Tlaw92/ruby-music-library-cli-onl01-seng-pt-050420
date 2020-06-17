module Concerns
  
  module Creatable
  
    def create(attribute)
      object= self.new(attribute)
      object.save
      object 
    end 
    
    def find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end

    self.find_by_name(name) || self.create(name)


  end
end
  
  end 

end 


