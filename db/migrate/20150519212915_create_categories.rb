class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_color
      t.string :category_name
      t.integer :user_id

      t.timestamps

    end
  end
end
