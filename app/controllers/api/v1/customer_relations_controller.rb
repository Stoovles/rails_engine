class Api::V1::CustomerRelationsController < ApplicationController

  def index
    @customer = Customer.find(params[:id])
    if request.path.include?("invoices")
      @customer_invoices = @customer.invoices
      render json: InvoiceSerializer.new(@customer_invoices)
    elsif request.path.include?("transactions")
      @customer_transactions = Transaction.where(invoice_id: [@customer.invoices.pluck(:id)])
      render json: TransactionSerializer.new(@customer_transactions)
    end
  end

end
