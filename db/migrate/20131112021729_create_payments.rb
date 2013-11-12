class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :card_type
      t.string :credit_card_number
      t.string :experiation_date
      t.integer :user_id

      t.timestamps
    end
  end
end
