class User
    def initialize(name, item, amount, timesdaily)
        @name = name
        @items  = item
        @amount = amount
        @timesdaily = timesdaily
    end

    def print_user
        puts "Well Done #{@name} you have taken #{@items} "
        @item += 1
        @amount += 1
    end

    # def print_user
    #     user_info = 


  