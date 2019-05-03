class Api::V1::InvoiceRelationsController < ApplicationController

  def index
    @invoice = Invoice.find(params[:id])
    if request.path.include?("transactions")
      @invoice_transactions = @invoice.transactions
      render json: @invoice_transactions
    elsif request.path.include?("invoice_items")
      @invoice_invoice_items = @invoice.invoice_items
      render json: @invoice_invoice_items
    elsif request.path.include?("items")
      @invoice_items = @invoice.items
      render json: @invoice_items
    elsif request.path.include?("customer")
      @invoice_customer = @invoice.customer
      render json: @invoice_customer
    elsif request.path.include?("merchant")
      @invoice_merchant = @invoice.merchant
      render json: @invoice_merchant
    end
  end

end
