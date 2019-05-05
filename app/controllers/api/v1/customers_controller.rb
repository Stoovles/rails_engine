class Api::V1::CustomersController < ApplicationController
  include Randomness
  before_action :set_customer, only: [:show]
  before_action :set_customers, only: [:index]

  # GET /customers
  def index
    render json: CustomerSerializer.new(@customers)
  end

  # GET /customers/1
  def show
    render json: CustomerSerializer.new(@customer)
  end

  def serializer
    CustomerSerializer
  end

  def model_object
    Customer
  end

  private
    def set_customer
      if(params.has_key?(:first_name))
        @customer = Customer.find_by(first_name: params[:first_name])
      elsif(params.has_key?(:last_name))
        @customer = Customer.find_by(last_name: params[:last_name])
      elsif(params.has_key?(:created_at))
        @customer = Customer.find_by(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @customer = Customer.find_by(updated_at: params[:updated_at])
      else
        @customer = Customer.find(params[:id])
      end
    end

    def set_customers
      if(params.has_key?(:first_name))
        @customers = Customer.where(first_name: params[:first_name])
      elsif(params.has_key?(:last_name))
        @customers = Customer.where(last_name: params[:last_name])
      elsif(params.has_key?(:id))
        @customers = Customer.where(id: params[:id])
      elsif(params.has_key?(:created_at))
        @customers = Customer.where(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @customers = Customer.where(updated_at: params[:updated_at])
      else
        @customers = Customer.all
      end
    end

end
