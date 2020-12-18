require "tty-prompt"

prompt = TTY::Prompt.new

prompt.ask("What is your name?", default: ENV["USER"])

choices = %w(beer expresso-martini coffee water-thanks!)
prompt.multi_select("Select youre drink of choice and welcome in!", choices)

p "Nice Choice!"

sleep(2)

def print_options
    puts "1. Show user list"
    puts "2. Add item to the user list"
    puts "3. Edit item from the user list"
    puts "4. Delete a item from the user list"
    puts "5. Exit"
    print "Select your option (1-5): "
    option = gets.chomp
    return option
end
def print_item(users)
    puts "This is the user list: "
   
    users.each do |user|
        puts "#{user[:user].capitalize}: #{user[:item]}"
        #user[:item].each do
    end
end


def add_item(users)
    print_item(users)
    print "What is the name of the User you wish to edit?"
    person = gets.chomp
    users.each do |user|
        if user[:user] == person
            print "What's the name of the new item? "
            added_item = gets.chomp
            user[:item].push(added_item)
            puts "Adding #{added_item} to the user..."
            sleep(2)
            print_item(users)
        end
    end
end

def delete_item(users)
    print_item(users)
    print "What is the name of the User you wish to delete their item?"
    person = gets.chomp
    users.each do |user|
        if user[:user] == person
            print "What's the name of the item you wish to delete there partner? "
            name = gets.chomp
            print "Are you sure you want to delete it?(y/n)"
            confirm = gets.chomp
             if confirm == "y"
                user[:item].delete(name) 
                puts "Deleting #{name}..."
            else 
                puts "delete aborted!"
            end
            sleep(2)
            print_item(users)
        end
    end
end

def replace_item(users)
    print_item(users)
    print "What is the name of the User you wish to replace the item in?"
    person = gets.chomp   
    print "What's the item you want to replace? "
    name = gets.chomp
    if users.any?{|item| item[:name] == name }
        puts "What's the item for #{user}?"
        name = gets.chomp.to_f
        users.each do |item|
            if user[:item] == item
                user[:item] = item
            end
        end
        puts "Replacing existing with new item #{name}..."
        
    else
        puts "#{name} is not on the supplement list, please choose again"
    end
    sleep(2)
    print_item(users)
end



user = [
    {user: "Peter", item: ["Vitamin C", "Vitamin D" , "Multivitamin", "Fish Oil", "Back-Flips 5000", "Wrestle Lion"]},
    {user: "Sarah", item: ["Glucosamine", "BCAA", "ProteinPowder", "FishOil", "Multivitamin"]},
    {user: "Terry", item: ["Multivitamin", "Jump 50M High", "2500 steps", "Leg Stretches AM/PM, '10,000 StarJumps"]},
    {user: "Isabelle", item: ["Aspirin, Vitamin C, Lift Boulder 10Tonne, Seated Squats 20, Multivitamin"]},
    {user: "King George", item: ["20 Killings", "5 Bottle Wine", "Sleeping 20hrs Day", "Eat large boar", "5 wenches"]}
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
            puts "invalid option"
    end
    puts "press Enter key to continue..."
    gets
    system "clear"
end

