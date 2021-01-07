class Character
    attr_accessor :name, :gender, :occupation, :species, :homePlanet
    @@all = []
    def initialize(name, gender, occupation, species, homePlanet)
        @name = name
        @gender = gender
        @occupation = occupation
        @species = species
        @@all << self
    end 
    def self.all
        @@all 
    end
    def self.find_by_id(id)
        index = id.to_i - 1
        all[index]
    end
end