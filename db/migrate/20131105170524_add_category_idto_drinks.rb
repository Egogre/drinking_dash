class AddCategoryIdtoDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :category_id, :integer
    add_index :drinks, :category_id
  end
end
