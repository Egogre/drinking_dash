class SetQuantityToZeroDefaultInOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :quantity, :integer
    add_column :order_items, :quantity, :integer, :default => 0
  end
end
