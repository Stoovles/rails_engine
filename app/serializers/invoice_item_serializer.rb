class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :quantity, :invoice_id, :item_id

  attribute :unit_price do |object|
    (object.unit_price.to_f / 100).to_s
  end
  
end
