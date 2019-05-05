class Api::V1::CustomerBusinessLogicsController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @favorite_merchant = @customer.favorite_merchant
    render json: MerchantSerializer.new(@favorite_merchant)
  end

end
