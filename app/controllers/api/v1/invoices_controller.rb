class Api::V1::InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]
  before_action :set_invoices, only: [:index]

  # GET /invoices
  def index
    render json: InvoiceSerializer.new(@invoices)
  end

  # GET /invoices/1
  def show
    render json: InvoiceSerializer.new(@invoice)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      if(params.has_key?(:status))
        @invoice = Invoice.find_by(status: params[:status])
      elsif(params.has_key?(:merchant_id))
        @invoice = Invoice.find_by(merchant_id: params[:merchant_id])
      elsif(params.has_key?(:customer_id))
        @invoice = Invoice.find_by(customer_id: params[:customer_id])
      else
        @invoice = Invoice.find(params[:id])
      end

  def set_invoices
    if(params.has_key?(:status))
      @invoices = Invoice.where(status: params[:status])
    elsif(params.has_key?(:merchant_id))
      @invoices = Invoice.where(merchant_id: params[:merchant_id])
    elsif(params.has_key?(:customer_id))
      @invoices = Invoice.where(customer_id: params[:customer_id])
    else
      @invoices = Invoice.all
    end
  end
end
