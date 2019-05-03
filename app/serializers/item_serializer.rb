class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id, :description, :merchant_id

  attribute :unit_price do |object|
    (object.unit_price.to_f / 100).to_s
  end

end
