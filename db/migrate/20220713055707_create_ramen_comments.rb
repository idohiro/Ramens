class CreateRamenComments < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen_comments do |t|
      t.text :body

      t.timestamps
    end
  end
end
