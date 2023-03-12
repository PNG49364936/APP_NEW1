class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :type_of_menu
      t.integer :preparation_time
      t.string :ingredient1
      t.string :ingredient2
      t.string :ingredient3
      t.string :ingredient4
      t.string :ingredient5
      t.string :ingredient6
      t.string :type_of_diet
      t.string :type_of_cuisine
      t.integer :guests
      t.string :list_of_ingredients_with_quantity

      t.timestamps
    end
  end
end
