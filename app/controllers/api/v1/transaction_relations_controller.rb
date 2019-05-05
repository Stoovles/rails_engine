class Api::V1::TransactionRelationsController < ApplicationController

  def show
    @transaction = Transaction.find(params[:id])
    @transaction_invoice = @transaction.invoice
    render json: InvoiceSerializer.new(@transaction_invoice)
  end


end
