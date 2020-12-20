require "tty-prompt"
require "colorize"
require "bundler"
require "rspec"
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}

puts ARGV

#Added this TTY Prompt for future use, each person will need to login.
prompt = TTY::Prompt.new
prompt.ask("What is your name?", default: ENV["USER"])
puts "Access Granted".red


# More future code

# def get_details
#     member_details = hash.new(0)
#     puts "Please Enter Your First Name"
#     member_details[:first_name] = gets.strip
#     puts "Please Enter Youre Last Name"
#     member_details[:last_name] = gets.strip
#     return member_details
# end

choices = %w(tea expresso-martini coffee water)
prompt.multi_select("Select youre drink of choice and welcome in!", choices)

puts "Nice Choice!".green


puts "FETCHING THE MAIN MENU PLEASE WAIT...".red.bold.underline

sleep(2)

#This is the main menu list

    def print_options
        # while true
        options = ["1","2","3","4","5"]
        puts "1. Show user list".yellow
        puts "2. Add item to the user list".green
        puts "3. Edit item from the user list".yellow
        puts "4. Delete a item from the user list".red
        puts "5. Exit".green.bold.underline
        print "Select your option (1-5):".light_blue
        input_option = gets.strip
    # This code isnt working so i have removed it. It was creating an inifite loop.
    #     if !options.include?(input_option)
    #         puts "Sorry, I was expecting an integer: 1,2,3,4 OR 5"
    #     end
    # return options
    end

def print_item(users)
    puts "This is the user list: "
   
    users.each do |user|
        puts "#{user[:user].capitalize}: #{user[:item]}"
        #user[:item].each do
    end
end

#This is the add item def.
def add_item(users)
    print_item(users)
    print "What is the name of the user you wish to edit?".yellow
    person = gets.chomp
    users.each do |user|
        if user[:user] == person
            print "What's the name of the new item? ".green
            added_item = gets.chomp
            user[:item].push(added_item)
            puts "Adding #{added_item} to the user...".red
            sleep(2)
            print_item(users)
        end
    end
end

#This is the delete an item from user part.
def delete_item(users)
    print_item(users)
    print "What is the name of the user you wish to delete their item?".green
    person = gets.chomp
    users.each do |user|
        if user[:user] == person
            print "What's the name of the item you wish to delete there partner?".yellow
            name = gets.chomp
            print "WARNING!! Are you sure you want to delete it?(y/n)".red
            confirm = gets.chomp
             if confirm == "y"
                user[:item].delete(name) 
                puts "Deleting #{name}...".red.bold.underline
            else 
                puts "delete aborted!"
            end
            sleep(2)
            print_item(users)
        end
    end
end

#This is the replace an item from user code.
def replace_item(users)
    print_item(users)
    print "What is the name of the user you wish to replace the item in?".light_blue
    person = gets.chomp   
    
    if users.any?{|user| user[:user] == person }
        print "What's the item you want to replace? ".green
        name = gets.chomp
        users.each do |user|
            if user[:user] == person
                count = 0
                user[:item].each do |item|
                    if item == name
                        puts "What's the new item you would like to replace with #{@name}?".yellow
                        newname = gets.chomp
                        user[:item][count] = newname
                    end
                    count += 1

                end
            end
        end
        puts "Replacing existing with new item #{name}...".red.underline
        
    else
        puts "#{name} is not on the supplement list, please choose again".bold
    end
    sleep(2)
    print_item(users)
end


#This is my array of users with their items.
user = [
    {user: "Paul", item: ["Vitamin C", "Vitamin D" , "Multivitamin", "Fish Oil", "Back-Flips 5000", "Wrestle Lion"]},
    {user: "Sarah", item: ["Glucosamine", "BCAA", "ProteinPowder", "Fish Oil", "Creatine 5G"]},
    {user: "Terry", item: ["Multivitamin", "Jump 50M High", "2500 steps", "Leg Stretches AM/PM, '10,000 StarJumps"]},
    {user: "Isabelle", item: ["Creatine", "EAA 5G", "Lift 500KG Boulder", "Seated Squats 20", "Multivitamin"]},
    {user: "Kinggeorge", item: ["20 Beheadings", "5 Bottle Wine", "Sleeping 20hrs Day", "Eat large boar", "5 wenches"]}
]
opt=""
while opt != "5"
    opt = print_options

    
    system "clear"
    case opt
        when "1" 
            print_item(user)
        when "2"
            puts "add item"
            add_item(user)
        when "3"
            puts "replace"
            replace_item(user)
        when "4"
            puts "delete"
            delete_item(user)
        when "5"
            puts "exit"
            next
        else
            puts "invalid option".red
    end
    puts "press Enter key to continue...".green
    gets
    system "clear"
end

