class Api::V1::MerchantRelationsController < ApplicationController

  def index
    @merchant = Merchant.find(params[:id])
    if request.path.include?("items")
      @merchant_items = @merchant.items
      render json: ItemSerializer.new(@merchant_items)
    elsif request.path.include?("invoices")
      @merchant_invoices = @merchant.invoices
      render json: InvoiceSerializer.new(@merchant_invoices)
    end
  end

end
