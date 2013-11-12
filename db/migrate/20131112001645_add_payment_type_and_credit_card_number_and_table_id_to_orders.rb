class AddPaymentTypeAndCreditCardNumberAndTableIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_type, :string
    add_column :orders, :credit_card_number, :string
    add_column :orders, :table_id, :integer, default: 0
  end
end
