
class Cli
 
   def start
    load_data
    sleep(1.0)
    logo 
    sleep(1.5)
    print_main_menu
   end

   def logo
    puts <<-'ART'.cyan

    |.--------_--_------------_--__--.|
     ||    /\ |_)|_)|   /\ | |(_ |_   ||
     ;;`,_/``\|__|__|__/``\|_| _)|__ ,:|
    ((_(-,-----------.-.----------.-.)`)
     \__ )        ,'     `.        \ _/
     :  :        |_________|       :  :
     |-'|       ,'-.-.--.-.`.      |`-|
     |_.|      (( (*  )(*  )))     |._|
     |  |       `.-`-'--`-'.'      |  |
     |-'|        | ,-.-.-. |       |._|
     |  |        |(|-|-|-|)|       |  |
     :,':        |_`-'-'-'_|       ;`.;
      \  \     ,'           `.    /._/
       \/ `._ /_______________\_,'  /
        \  / :   ___________   : \,'
         `.| |  |           |  |,'
           `.|  |           |  |
             |  |           |  |
        ART
    end
    def print_main_menu #Welcome Menu 
        puts ""
        puts "Welcome to the World of Tomorrow (or just a Futurama CLI app)!".cyan
        puts ""
        puts "Good News Everyone! You can grab a list of characters from the show, see a variety of quotes, or even learn more about your favorite characters!"
        puts ""
        puts "To view all Futurama characters from the show, please type 'list characters'."
        puts "To view some fun quotes from Futurama characters, please type 'list quotes'."
        puts "To finish your session, please type 'exit'."
        user_main_menu_choice
    end

   def user_main_menu_choice #where the user is going to make their choice

    input = gets.chomp.strip 

     if input.downcase == "list quotes"
        list_quotes
        put_continue 
        continue?(deeper_choice)
     elsif input.downcase == "list characters"
        list_characters
        more_info
     elsif input.downcase == "exit"
        exit_cli
     else
        print_error 
        print_main_menu
        end
    end

    def sorted_quotes
        Quote.all.sort_by {|q| q.name}
    end
   def list_quotes 
        sorted_quotes.each.with_index(1) do |q,i| 
        puts "#{i}. #{q.quote} - #{q.name}"
        sleep (0.25)
        end
    end

    def sorted_characters
        Character.all.sort_by {|c| c.name["last"]}
    end
    
    def list_characters
        puts "List of Characters"
        sorted_characters.each.with_index(1) do |c, i|
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
            sleep (0.15)
        end
    end

def more_info
    
    deeper_prompt #prompt that encourages deeper use 
    puts ""
    id = valid_id?(deeper_choice)#confirm that id is valid #select a character by their id
    character = Character.find_by_id(id)#find character in the array of characters so that I can find through their ID 
    character_details(character, id)
    puts ""  #give details about character
    put_continue 
    continue?(deeper_choice)
    print_main_menu
    user_main_menu_choice
end

def deeper_choice
    gets.chomp.strip
end

def deeper_prompt
    puts""
    puts "Choose a character by number to learn more!".cyan
end

def valid_id?(id)
    id = id.to_i
    if id <1 || id > Character.all.size
        print_error2
        more_info
    end
    id
end

def print_error2
    puts "You broke our spaceship. Please try again!".red
end

def character_details(character, id)
        puts "Name: #{character.name["first"]} #{character.name["middle"]} #{character.name["last"]}"
        puts "Species: #{character.gender}" 
        puts "Gender: #{character.occupation}" 
        puts "Occupation: #{character.homePlanet}" 
        puts ""
        sleep(0.5)
        puts "Here Come Some Quotes..."
        puts ""
        sleep(1.75)
        puts "Quotes:" 
            character.sayings.each.with_index do |s, i|
                iplusone = i + 1 
            puts "#{iplusone}. #{s} "
            sleep (0.15)
            end
       
end

    def exit_cli
        puts ""
        puts "Goodbye Everybody!".cyan
        puts "Thank you for choosing Planet Express!".cyan 
        puts ""
        exit
    end


    def load_data 
        puts "Waking up from cryogenic sleep...".cyan
        sleep(1.5)
        quotes_loader = Api.quote
        character_loader = Api.character
        puts "Doors Open!".cyan
        sleep(0.5)
    end

def print_error

    puts "That was not a good choice, try again meatbag.".red

end

def put_continue
    puts "Would you like to continue? Please enter (y/n)."
end

def continue?(pick)
    if pick == "y" 
        system("clear")
        print_main_menu
    elsif pick == "n"
        exit_cli
        exit
    else 
        print_error
        put_continue
        continue?(deeper_choice)
    end
    
end
end