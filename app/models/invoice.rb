class Invoice < ApplicationRecord
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :merchant
  belongs_to :customer

  default_scope { order(id: :asc) }
  
end
