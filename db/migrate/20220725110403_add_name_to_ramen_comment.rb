class AddNameToRamenComment < ActiveRecord::Migration[6.1]
  def change
    add_column :ramen_comments, :Name, :string
      add_reference :ramen_comments, :customer, null: false, foreign_key: true
      add_reference :ramen_comments, :ramen, null: false, foreign_key: true
  end
end
