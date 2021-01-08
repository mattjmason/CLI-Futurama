
class Cli
 
   def start 
    load_data
    print_main_menu
   end

    def print_main_menu #Welcome Menu 
        puts ""
        puts ""
        puts "Welcome to the World of Tomorrow (or just a Futurama CLI app)!".cyan
        puts ""
        puts "Good News Everyone! You can grab a list of characters from the show, see a variety of quotes, or even learn more about your favorite characters"
        puts ""
        puts "To view all Futurama characters from the show, please type 'list characters'."
        puts "To view quotes from Futurama characters, please type 'list quotes'."
        puts "To finish your session, please type 'exit'."
        user_main_menu_choice
    end

   def user_main_menu_choice #where the user is going to make their choice

    input = gets.chomp 

     if input.downcase == "list quotes"
        list_quotes
        print_main_menu
     elsif input.downcase == "list characters"
        list_characters
        more_info
     elsif input.downcase == "exit"
        exit_cli
     else
        #error for when user messes up
        print_main_menu
        end
    end
        
   def list_quotes 
        Quote.all.each.with_index(1) do |q,i| 
        puts "#{i}. #{q.quote} - #{q.name}"
        end
    end

    def list_characters
        puts "List of Characters"
        Character.all.each.with_index(1) do |c, i|
            first, middle, last = c.name["first"], c.name["middle"], c.name["last"]
            ans = "#{i}. "
            if first != ""
                ans += first + " "
            end
            if middle != ""
                ans += middle  + " "
            end
            ans += last
            puts ans 
        end
    end

def more_info
    
    deeper_prompt #prompt that encourages deeper use 
    id = valid_id?(deeper_choice)#confirm that id is valid #select a character by their id
    character = Character.find_by_id(id)#find character in the array of characters so that I can find through their ID 
    character_details(character)  #give details about character
    #continue or exit?

    #start over  
    print_main_menu

end

def deeper_choice
    gets
end

def deeper_prompt
    puts "Choose a character by number to learn more!".cyan
end

def valid_id?(id)
    id = id.to_i
    if id <1 || id > Character.all.size
        exit #build in error later 
    end
    id
end
def character_details(character)
  
    puts "Name: #{character.name["first"]} #{character.name["middle"]} #{character.name["last"]}"
    # puts "Age: #{character.age}" 
    puts "Species: #{character.info["species"]}" #solve for characters that don't have info hash
    puts "Occupation: #{character.homePlanet}"
    puts "Gender: #{character.info["gender"]}" #make sure correct 
    puts "Sayings:" 
        character.sayings.each_with_index do |s, i|
            iplusone = i + 1 
        puts "#{iplusone}. #{s} "
        end

end




    def exit_cli
        puts ""
        puts "Thanks for trying out the Planet Express Ship!".cyan
        puts "Hopefully it's the best thing that you ever saw!".cyan 
        exit
    end


    def load_data 
        quotes_loader = Api.quote
        character_loader = Api.character
    end



#     def logo 

#         puts "
                                                         
#                     __,' __`.                _..----....____
#         __...--.'``;.   ,.   ;``--..__     .'    ,-._    _.-'
#   _..-''-------'   `'   `'   `'     O ``-''._   (,;') _,'
# ,'________________                          \`-._`-','
#  `._              ```````````------...___   '-.._'-:
#     ```--.._      ,.                     ````--...__\-.
#             `.--. `-`                       ____    |  |`
#               `. `.                       ,'`````.  ;  ;`
#                 `._`.        __________   `.      \'__/`
#                    `-:._____/______/___/____`.     \  `
#                                |       `._    `.    \
#                                          SSt  `------'` "
#                                              .cyan
#     end

end