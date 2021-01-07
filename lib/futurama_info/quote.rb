class Quote 
    
    
    attr_accessor :name, :quote

    @@all = []

    def initialize(name, quote)
        @name = name
        @quote = quote 
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