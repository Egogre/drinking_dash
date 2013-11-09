class AddImageUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image_url, :string, :default => "default.jpg"
  end
end
