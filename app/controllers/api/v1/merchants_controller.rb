class Api::V1::MerchantsController < ApplicationController
  include Randomness
  before_action :set_merchant, only: [:show]
  before_action :set_merchants, only: [:index]

  # GET /merchants
  def index
    render json: MerchantSerializer.new(@merchants)
  end

  # GET /merchants/1
  def show
    render json: MerchantSerializer.new(@merchant)
  end

  def serializer
    MerchantSerializer
  end

  def model_object
    Merchant
  end

  private
    def set_merchant
      if(params.has_key?(:name))
        @merchant = Merchant.find_by(name: params[:name])
      elsif(params.has_key?(:created_at))
        @merchant = Merchant.find_by(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @merchant = Merchant.find_by(updated_at: params[:updated_at])
      else
        @merchant = Merchant.find(params[:id])
      end
    end

    def set_merchants
      if(params.has_key?(:name))
        @merchants = Merchant.where(name: params[:name])
      elsif(params.has_key?(:id))
        @merchants = Merchant.where(id: params[:id])
      elsif(params.has_key?(:created_at))
        @merchants = Merchant.where(created_at: params[:created_at])
      elsif(params.has_key?(:updated_at))
        @merchants = Merchant.where(updated_at: params[:updated_at])
      else
        @merchants = Merchant.all
      end
    end


end
