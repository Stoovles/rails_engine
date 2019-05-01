class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show]
  before_action :set_customers, :only: [:index]

  # GET /customers
  def index
    render json: CustomerSerializer.new(@customers)
  end

  # GET /customers/1
  def show
    render json: CustomerSerializer.new(@customer)
  end

  def serializer
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      if(params.has_key?(:first_name))
        @customer = Customer.find_by(first_name: params[:first_name])
      elsif(params.has_key?(:last_name))
        @customer = Customer.find_by(last_name: params[:last_name])
      else
        @customer = Customer.find(params[:id])
      end
    end

    def set_customers
      if(params.has_key?(:first_name))
        @customers = Customer.where(first_name: params[:first_name])
      elsif(params.has_key?(:last_name))
        @customers = Customer.where(last_name: params[:last_name])
      else
        @customers = Customer.all
      end
    end

end
