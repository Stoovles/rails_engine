class Customer < ApplicationRecord
  has_many :invoices

  def favorite_merchant
    Merchant.select("merchants.*, count(transactions.id) AS transaction_count")
            .joins(invoices: :transactions)
            .where(invoices: {customer_id: self.id})
            .where(transactions: {result: "success"})
            .group(:id)
            .order("transaction_count DESC")
            .first
  end

end
