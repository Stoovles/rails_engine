class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :unit_price, :invoice_id, :item_id
end
