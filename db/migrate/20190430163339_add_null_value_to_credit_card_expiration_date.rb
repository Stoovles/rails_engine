class AddNullValueToCreditCardExpirationDate < ActiveRecord::Migration[5.1]
  def change
    change_column_null :transactions, :credit_card_expiration_date, true
  end
end
