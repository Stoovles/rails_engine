class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices



  def total_revenue(date = nil)
    date_range = (date && DateTime.parse(date).all_day) || (Time.new(0)..Time.now)
    invoices.joins(:invoice_items, :transactions)
            .where(transactions: {result: "success"})
            .where(created_at: date_range)
            .sum("invoice_items.quantity * invoice_items.unit_price").to_f / 100
  end

  def favorite_customer
    Customer.joins(invoices: :transactions)
            .select("customers.*, COUNT(transactions.id) as transaction_count")
            .where(transactions: {result: "success"})
            .where(invoices: {merchant_id: self.id})
            .group(:id)
            .order("transaction_count DESC")
            .first
  end

end
