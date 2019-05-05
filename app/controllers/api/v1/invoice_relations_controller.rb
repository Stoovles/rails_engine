class Api::V1::InvoiceRelationsController < ApplicationController

  def index
    @invoice = Invoice.find(params[:id])
    if request.path.include?("transactions")
      @invoice_transactions = @invoice.transactions
      render json: TransactionSerializer.new(@invoice_transactions)
    elsif request.path.include?("invoice_items")
      @invoice_invoice_items = @invoice.invoice_items
      render json: InvoiceItemSerializer.new(@invoice_invoice_items)
    elsif request.path.include?("items")
      @invoice_items = @invoice.items
      render json: ItemSerializer.new(@invoice_items)
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    if request.path.include?("customer")
      @invoice_customer = @invoice.customer
      render json: CustomerSerializer.new(@invoice_customer)
    elsif request.path.include?("merchant")
      @invoice_merchant = @invoice.merchant
      render json: MerchantSerializer.new(@invoice_merchant)
    end
  end

end
