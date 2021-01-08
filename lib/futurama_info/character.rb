class Character
    attr_accessor :name, :occupation, :gender, :species, :homePlanet, :info, :sayings

    @@all = []

    def initialize(name, occupation, gender, species, homePlanet, info, sayings)
        @name = name
        # @age = age
        @occupation = occupation
        @sayings = sayings
        @species = species
        @gender = gender
        @info = info
        @homePlanet = homePlanet
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