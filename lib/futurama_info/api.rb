

class Api

URL = "https://api.sampleapis.com/futurama/characters"
URL2 = "https://futuramaquoteapi.herokuapp.com/allquotes"

def self.character 
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
     data = JSON.parse(response.body)
     data.each do |c| 
        gender = c["gender"]
        species = c["species"]
        homePlanet = c["homePlanet"]
        if info = c["info"]
            gender = info["gender"]
            species = info["species"]
            homePlanet = info["homePlanet"]
        end
        Character.new(c["name"], gender, species, homePlanet, c["occupation"], c["info"], c["sayings"])
     end
end

def self.quote
    uri = URI.parse(URL2)
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    data.each do |q| Quote.new(q["name"], q["quote"])
    end
end
end 

