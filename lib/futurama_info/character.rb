class Character
    attr_accessor :name, :occupation, :gender, :species, :homePlanet, :info

    @@all = []

    def initialize(name, occupation, gender, species, homePlanet, info)
        @name = name
        @occupation = occupation
        @species = species 
        @gender = gender
        @homePlanet = homePlanet
        @info = info
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