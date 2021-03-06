class Api::V1::TransactionsController < ApplicationController
  include Randomness
  before_action :set_transaction, only: [:show]
  before_action :set_transactions, only: [:index]

  # GET /transactions
  def index
    render json: TransactionSerializer.new(@transactions)
  end

  # GET /transactions/1
  def show
    render json: TransactionSerializer.new(@transaction)
  end

  def serializer
    TransactionSerializer
  end

  def model_object
    Transaction
  end

  private
    def set_transaction
      if(params.has_key?(:credit_card_number))
        @transaction = Transaction.find_by(credit_card_number: params[:credit_card_number])
      elsif(params.has_key?(:credit_card_expiration_date))
        @transaction = Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
      elsif(params.has_key?(:result))
        @transaction = Transaction.find_by(result: params[:result])
      elsif(params.has_key?(:invoice_id))
        @transaction = Transaction.find_by(invoice_id: params[:invoice_id])
      elsif(params.has_key?(:created_at))
        @transaction = Transaction.find_by(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @transaction = Transaction.find_by(updated_at: params[:updated_at])
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
      elsif(params.has_key?(:id))
        @transactions = Transaction.where(id: params[:id])
      elsif(params.has_key?(:created_at))
        @transactions = Transaction.where(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @transactions = Transaction.where(updated_at: params[:updated_at])
      else
        @transactions = Transaction.all
      end
    end


end
