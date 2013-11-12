class DropColumnsPaymentTypeCreditCardNumberFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :payment_type
    remove_column :orders, :credit_card_number
  end
end
