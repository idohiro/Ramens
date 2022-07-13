class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
      t.string :name
      t.string :shop_name
      t.integer :ramen_image
      t.text :introduction
      t.integer :price
      t.text :limited_information

      t.timestamps
    end
  end
end
