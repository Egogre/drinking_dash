class ChangeColumnNameExperiationDateToExpirationDateInPayment < ActiveRecord::Migration
  def change
    rename_column :payments, :experiation_date, :expiration_date
  end
end
