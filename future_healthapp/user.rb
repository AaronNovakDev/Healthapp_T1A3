class User
    attr_reader :name
    attr_accessor :items
    attr_accessor :amount
    attr_accessor :timesdaily


    def initialize(name, item, amount, timesdaily)
        @name = name
        @items  = []
        @amount = []
        @timesdaily = []
    end

    def print_user
        puts "Well Done #{@name} you have taken #{@items} "
        @item += 1
        @amount += 1
    end

    # def print_user
    #     user_info = 


  