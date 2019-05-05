class Api::V1::MerchantBusinessLogicsController < ApplicationController


  def show
    @merchant = Merchant.find(params[:id])
    if request.path.include?("/revenue")
      total_revenue = {"data" => {"attributes" => {:revenue => @merchant.total_revenue(params[:date]).to_s }}}
      render json: total_revenue.to_json
    elsif request.path.include?("/favorite_customer")
      render json: CustomerSerializer.new(@merchant.favorite_customer)
    end
  end

  def index

  end


end
