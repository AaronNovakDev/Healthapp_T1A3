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
    print "What is the name of the User you wish to edit?"
    person = gets.chomp
    print "What's the name of the product you want to delete? "
    name = gets.chomp
    if array_item.any?{|item| item[:name] == name }
        print "Are you sure you want to delete it?(y/n)"
        confirm = gets.chomp
        if confirm == "y"
         
            array_item.delete_if{|item| item[:name] == name }
            puts "Deleting #{user[item]}..."
        else 
            puts "delete aborted!"
        end
    else
        puts "#{name} is not in our menu"
    end
    sleep(2)
    print_item(array_item)
end

def update_list(array_item)
    print "What's the item you want to update? "
    name = gets.chomp
    if array_item.any?{|item| product[:name] == name }
        puts "What's the item for #{user}?"
        price = gets.chomp.to_f
        array_item.each do |item|
            if product[:name] == name
                product[:price] = price
            end
        end
        puts "Updating the #{price} of #{name}..."
        
    else
        puts "#{name} is not in our menu"
    end
    sleep(2)
    print_item(array_item)
end



user = [
    {user: "Aaron", item: ["Vitamin C", "Vitamin D" , "Multivitamin", "Fish Oil", "Back-Flips 5000", "Wrestle Lion"]},
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
            puts "edit"
            update_item(user)
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

