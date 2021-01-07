
class Cli
 
   def start 
    load_data
    print_main_menu
   end

    def print_main_menu 
        puts ""
        puts "Welcome to the Futurama CLI App!".yellow
        user_main_menu_choice
    end

   def user_main_menu_choice
    input = gets.chomp 
     if input.downcase == "list quotes"
        list_quotes
     elsif input.downcase == "list characters"
        list_characters
     else
        start 
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