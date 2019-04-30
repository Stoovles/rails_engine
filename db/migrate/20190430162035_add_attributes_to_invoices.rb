class AddAttributesToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :status, :string
    add_reference :invoices, :merchant, foreign_key: true
    add_reference :invoices, :customer, foreign_key: true

    add_timestamps :invoices


  end
end
