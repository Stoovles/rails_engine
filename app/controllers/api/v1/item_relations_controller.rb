class Api::V1::ItemRelationsController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @item_invoice_items = @item.invoice_items
    render json: InvoiceItemSerializer.new(@item_invoice_items)
  end

  def show
    @item = Item.find(params[:id])
    @item_merchant = @item.merchant
    render json: MerchantSerializer.new(@item_merchant)
  end


end
