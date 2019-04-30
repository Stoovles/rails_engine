require 'csv'

namespace :import do
  desc "Import from CSV file"

  task items: :environment do
    CSV.foreach('./lib/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  task customers: :environment do
    CSV.foreach('./lib/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  task invoice_items: :environment do
    CSV.foreach('./lib/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  task invoices: :environment do
    CSV.foreach('./lib/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  task merchants: :environment do
    CSV.foreach('./lib/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  task transactions: :environment do
    CSV.foreach('./lib/transactions.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

end
