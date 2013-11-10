class SetAdminBooleanDefaultFalseToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin_role
    add_column :users, :admin_role, :boolean, :default => false
  end
end
