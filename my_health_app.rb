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
    end
end


def add_item(array_item)
    print "What's the name of the new item? "
    added_name = gets.chomp
    print "And how many times would you like to do for #{added_name}?"
    added_price = gets.chomp.to_f
   
    item = {user: added_user, item: added_item}


    array_item.push(product)
    puts "Adding #{added_name} to the menu..."
    sleep(2)
    print_item(array_item)
end

def delete_item(array_item)

    print "What's the name of the product you want to delete? "
    name = gets.chomp
    if array_item.any?{|item| item[:name] == name }
        print "Are you sure you want to delete it?(y/n)"
        confirm = gets.chomp
        if confirm == "y"
         
            array_item.delete_if{|item| user[:item] == item }
            puts "Deleting #{user[item]}..."
        else 
            puts "deletion aborted..."
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
    {user: "Aaron", item: "vitamin c, vitamin d , multivitamin, fish oil, back flips 500"},
    {user: "Sarah", item: "glucosamine, bcaa, protein powder, fish oil, multivitamin"},
    {user: "Terry", item: "multivitamin, jump 50m, 2500 steps, leg stretches am/pm, star jumps"},
    {user: "Isabelle", item: "aspirin, vit c, lift boulder, seated squats 20, multivitamin"},
    {user: "King George", item: "20 killings, 5 bottle wine, sleeping 20hrs daily, large boar, 5 wenches"}
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

