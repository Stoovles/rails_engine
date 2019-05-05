class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope { order(id: :asc) }


  def self.top_revenue(limit)
    unscoped.joins(invoices: :transactions)
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where(transactions: {result: "success"})
    .group(:id)
    .order('revenue DESC')
    .limit(limit)
  end


  def self.top_quantity_sold(limit)
    unscoped.joins(invoices: :transactions)
    .select("items.*, SUM(invoice_items.quantity) AS total_quantity")
    .where(transactions: {result: "success"})
    .group(:id)
    .order('total_quantity DESC')
    .limit(limit)
  end

  # def best_day

  # end


end
