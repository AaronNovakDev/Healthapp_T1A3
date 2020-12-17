def print_options
    puts "1. Show user list"
    puts "2. Add item to the user list"
    puts "3. Edit number required of a item in the user list"
    puts "4. Delete a item from the user list"
    puts "5. Exit"
    print "Select your option (1-5): "
    option = gets.chomp
    return option
end
def print_item(users)
    puts "This is the user list: "
   
    users.each do |user|
        puts "#{user[:user].capitalize}: $#{user[:item]}"
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
    #enter the name of the product and get Integer
    name = gets.chomp
    #add a confirmation of deleting
    if array_item.any?{|item| item[:name] == name }
        print "Are you sure you want to delete it?(y/n)"
        confirm = gets.chomp
        if confirm == "y"
         
            array_item.delete_if{|item| item[:name] == name }
            puts "Deleting #{name}..."
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
    #ask about the price I want to update
    print "What's the product's price you want to update? "
    #enter the name of the product and get Integer
    name = gets.chomp
    #add a confirmation of deleting
    if array_item.any?{|product| product[:name] == name }
        puts "What's the new price for #{name}?"
        price = gets.chomp.to_f
        #update the price in the array
        array_item.each do |product|
            if product[:name] == name
                product[:price] = price
            end
        end
        puts "Updating the price of #{name} to #{price}..."
        
    else
        puts "#{name} is not in our menu"
    end
    sleep(2)
    print_item(array_item)
end



user = [
    {user: "aaron", item: "vitamin c 500mg twice daily vitamin d 1000iu once daily multivitamin once daily"},
    {user: "sarah", item: "glucosamine 5g once daily, bcaa 5g twice daily, protein powder 20g once daily"},
    {user: "terry", item: "multivitamin once daily, steps 500 twice daily, leg stretches 20 seconds x 3 twice daily"},
    {user: "isabelle", item: "aspirin morning, vit c 1g twice daily, seated squats 10 x twice daily, multivitamin"},
    {user: "King George", item: "20 lashings to servent, 3 x bottles of wine, sleeping 20hrs once a day, 1 x large boar"}
]
opt=""
while opt != "5"
    opt = print_options

    
    system "clear"
    case opt
        when "1" #opt == "1"
            print_item(user)
        when "2"
            puts "add product"
            add_item(item)
        when "3"
            puts "edit"
            update_item(item)
        when "4"
            puts "delete"
            delete_item(item)
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

