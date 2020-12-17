puts "Hello friend! Welcome to your health app"
puts  "What is youre @(name)?"
gets = name.chomp
puts "Nice to meet you @(name), please enter in your age"
gets = age.chomp
puts "Please let me know any Allergies you may have , and i will make sure to let you know that youre allergic to them"
gets = allergies.chomp
puts = "Great, just one more question @(name), your nearly there and onto a great future healthy life! What is 
youre weight?"
gets = weight.chomp
puts "Great thank you kindly for the info so far"
puts " So @(name) youre @(age), and weigh @(weight), please enter the items you would like for me to store for 
you so that I can help you with what you need to take daily."
puts "add @(item) now, please"
gets = (@item)
puts "No problem, and how many times a day would you like to take @(item), @(number) (add 1 - 10) now please?"
puts "Sorry thats an invalid number, please enter 1 - 10"
gets = number.to_i
puts "hello @(name) you have taken x/x items today. You require to take another x of @(item)

puts " So @(name) How are you feeling today? (0. Good 1. Bad 2.Tired)

feel =  [good, bad, Tired]



puts "welcome to the main menu, here are youre choices"

menu [Info on various items, 
      Add/remove/modify,
      Your items, 
      Want quick energy?,
      Exit
      ]


require_relative("./user.rb")
user = Storeduser.new("Aaron", "Vitamin C", "500MG", "Morning and Night")
user1 = Storeduser.new("Sarah", "Vitamin D", "1000IU", "Morning")





#print options menu, invoke it at the beginning of the loop
def print_options
    puts "1. Info on Various Items"
    puts "2. Add/Modify an Item"
    puts "3. Your current health plan list"
    puts "4. Delete an Item from your health plan"
    puts "5. Exit"
    print "Select your option (1-5): "
    option = gets.chomp
    return option
end

def print_products(array_products)
    puts "This is our menu: "
    # Latte: $4.0
    # Espresso: $3.0
    #...
    array_products.each do |product|
        puts "#{product[:name].capitalize}: $#{product[:price]}"
    end
end

#add a product to the menu
def add_product(array_products)
    #ask for the name of the new product
    print "What's the name of the new product? "
    #enter the name of the of the new product
    added_name = gets.chomp
    #ask for the price
    print "And what's the amount you wish to take for #{added_name}?"
    #enter the price and get it
    added_price = gets.chomp.to_f
    #create the hash with the name and the price
    product = {name: added_name, amount: added_price}
    #add the hash to the array
    #get the name and add it to the array
    array_products.push(product)
    puts "Adding #{added_name} to the menu..."
    sleep(2)
    print_products(array_products)
end

def delete_products(array_products)
    #ask about the product I want to delete
    print "What's the name of the product you want to delete? "
    #enter the name of the product and get Integer
    name = gets.chomp
    #add a confirmation of deleting
    if array_products.any?{|product| product[:name] == name }
        print "Are you sure you want to delete it?(y/n)"
        confirm = gets.chomp
        if confirm == "y"
            #delete product
            array_products.delete_if{|product| product[:name] == name }
            puts "Deleting #{name}..."
        else 
            puts "deletion aborted..."
        end
    else
        puts "#{name} is not in our menu"
    end
    sleep(2)
    print_products(array_products)
end

def update_price(array_products)
    #ask about the price I want to update
    print "What's the product's price you want to update? "
    #enter the name of the product and get Integer
    name = gets.chomp
    #add a confirmation of deleting
    if array_products.any?{|product| product[:name] == name }
        puts "What's the new price for #{name}?"
        price = gets.chomp.to_f
        #update the price in the array
        array_products.each do |product|
            if product[:name] == name
                product[:price] = price
            end
        end
        puts "Updating the price of #{name} to #{price}..."
        
    else
        puts "#{name} is not in our menu"
    end
    sleep(2)
    print_products(array_products)
end


#set the Data
products = [
    {name: "latte", price: 4.0},
    {name: "espresso", price: 3.0},
    {name: "capuccino", price: 5.0},
    {name: "tea", price: 3.0},
    {name: "muffin", price: 5.0}
]
opt=""
while opt != "5"
    opt = print_options

    
    system "clear"
    case opt
        when "1" #opt == "1"
            print_products(products)
        when "2"
            puts "add product"
            add_product(products)
        when "3"
            puts "edit"
            update_price(products)
        when "4"
            puts "delete"
            delete_products(products)
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




# Program in Ruby for a count of total Grocery items 
class Supplement 

# class variable 
@@total_count = 0

# class array 
@@items_list = [] 

def add_item(item) 

	# adding item to the array 
	@@items_list.push(item) 
	@@total_count += 1#counting 
end

def print_items 
	puts "Total number of items --> #@@total_count"; 
	puts "All items --> #@@items_list"; 
end
# direct access 
def Supplement.printitems_only# or self.printitems_only 
	puts "\nSupplement.printitems_only", @@items_list.join("\n"); 
end
end

list = Supplement.new() 

list.add_item("Vitamin C 500MG") 


list.print_items