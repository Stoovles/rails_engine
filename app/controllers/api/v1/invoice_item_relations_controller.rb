class Api::V1::InvoiceItemRelationsController < ApplicationController

  def show
    @invoice_item = InvoiceItem.find(params[:id])
    if request.path.include?("/item")
      @invoice_item_item = @invoice_item.item
      render json: ItemSerializer.new(@invoice_item_item)
    elsif request.path.include?("/invoice")
      @invoice_item_invoice = @invoice_item.invoice
      render json: InvoiceSerializer.new(@invoice_item_invoice)
    end

  end


end
