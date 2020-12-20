require_relative '../my_health_app.rb'

describe "print_options" do
    options = ["1","2","3","4","5"]
    it 'It should return a value between 1,2,3,4 OR 5' do 
        expect(print_options).to eq()
    end
end

describe "delete item" do
    user = [
        {user: "Paul", item: ["Vitamin C", "Vitamin D" , "Multivitamin", "Fish Oil", "Back-Flips 5000", "Wrestle Lion"]},
        {user: "Sarah", item: ["Glucosamine", "BCAA", "ProteinPowder", "Fish Oil", "Creatine 5G"]},
        {user: "Terry", item: ["Multivitamin", "Jump 50M High", "2500 steps", "Leg Stretches AM/PM, '10,000 StarJumps"]},
        {user: "Isabelle", item: ["Creatine", "EAA 5G", "Lift 500KG Boulder", "Seated Squats 20", "Multivitamin"]},
        {user: "Kinggeorge", item: ["20 Beheadings", "5 Bottle Wine", "Sleeping 20hrs Day", "Eat large boar", "5 wenches"]}
    ]
    name = "Creatine"
      it "should delete an item from the users hash" do
        expect(delete_item(user[0][:item][0])).not_to eq("Vitamin C") 
      end
    end



