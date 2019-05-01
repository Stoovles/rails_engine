class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show]
  before_action :set_transactions, only: [:index]

  # GET /transactions
  def index
    render json: TransactionSerializer.new(@transaction)
  end

  # GET /transactions/1
  def show
    render json: TransactionSerializer.new(@transaction)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      if(params.has_key?(:credit_card_number))
        @transaction = Transaction.find_by(credit_card_number: params[:credit_card_number])
      elsif(params.has_key?(:credit_card_expiration_date))
        @transaction = Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
      elsif(params.has_key?(:result))
        @transaction = Transaction.find_by(result: params[:result])
      elsif(params.has_key?(:invoice_id))
        @transaction = Transaction.find_by(invoice_id: params[:invoice_id])
      else
        @transaction = Transaction.find(params[:id])
      end
    end

    def set_transactions
      if(params.has_key?(:credit_card_number))
        @transactions = Transaction.where(credit_card_number: params[:credit_card_number])
      elsif(params.has_key?(:credit_card_expiration_date))
        @transactions = Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
      elsif(params.has_key?(:result))
        @transactions = Transaction.where(result: params[:result])
      elsif(params.has_key?(:invoice_id))
        @transactions = Transaction.where(invoice_id: params[:invoice_id])
      else
        @transactions = Transaction.all
      end
    end


end
