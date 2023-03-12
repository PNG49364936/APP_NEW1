class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.text :content
      t.integer :menu_id

      t.timestamps
    end
  end
end
