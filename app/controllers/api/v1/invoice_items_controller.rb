class Api::V1::InvoiceItemsController < ApplicationController
  include Randomness
  before_action :set_invoice_item, only: [:show]
  before_action :set_invoice_items, only: [:index]

  # GET /invoice_items
  def index
    render json: InvoiceItemSerializer.new(@invoice_items)
  end

  # GET /invoice_items/1
  def show
    render json: InvoiceItemSerializer.new(@invoice_item)
  end

  def serializer
    InvoiceItemSerializer
  end

  def model_object
    InvoiceItem
  end

  private
    def set_invoice_item
      if(params.has_key?(:quantity))
        @invoice_item = InvoiceItem.find_by(quantity: params[:quantity])
      elsif(params.has_key?(:unit_price))
        @invoice_item = InvoiceItem.find_by(unit_price: (params[:unit_price].to_f*100).round)
      elsif(params.has_key?(:invoice_id))
        @invoice_item = InvoiceItem.find_by(invoice_id: params[:invoice_id])
      elsif(params.has_key?(:item_id))
        @invoice_item = InvoiceItem.find_by(item_id: params[:item_id])
      else
        @invoice_item = InvoiceItem.find(params[:id])
      end
    end

    def set_invoice_items
      if(params.has_key?(:quantity))
        @invoice_items = InvoiceItem.where(quantity: params[:quantity])
      elsif(params.has_key?(:unit_price))
        @invoice_items = InvoiceItem.where(unit_price: (params[:unit_price].to_f*100).round)
      elsif(params.has_key?(:invoice_id))
        @invoice_items = InvoiceItem.where(invoice_id: params[:invoice_id])
      elsif(params.has_key?(:item_id))
        @invoice_items = InvoiceItem.where(item_id: params[:item_id])
      elsif(params.has_key?(:id))
        @invoice_items = InvoiceItem.where(id: params[:id])
      else
        @invoice_items = InvoiceItem.all
      end
    end

end
