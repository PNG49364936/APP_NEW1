class Menu < ApplicationRecord
   
        attribute :type_of_menu, :string, default: "Normal"   
        attribute :type_of_diet, :string, default: "Normal"   
        attribute :type_of_cuisine, :string, default: "Normal"  
        attribute :list_of_ingredients_with_quantity, :string, default: "No" 
        validates :name, :ingredient1, :ingredient2, :ingredient3, :ingredient4, :ingredient5, :ingredient6, presence: true
        has_one :receipt
    
end
