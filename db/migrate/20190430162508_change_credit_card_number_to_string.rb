class ChangeCreditCardNumberToString < ActiveRecord::Migration[5.1]
  def change
    change_column :transactions, :credit_card_number, :string
    change_column_null :transactions, :credit_card_expiration_date, :null => true
  end
end
