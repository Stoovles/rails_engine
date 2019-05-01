class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :set_items, only: [:index]

  # GET /items
  def index
    render json: ItemSerializer.new(@items)
  end

  # GET /items/1
  def show
    render json: ItemSerializer.new(@item)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      if(params.has_key?(:name))
        @item = Item.find_by(name: params[:name])
      elsif(params.has_key?(:description))
        @item = Item.find_by(description: params[:description])
      elsif(params.has_key?(:unit_price))
        @item = Item.find_by(unit_price: params[:unit_price])
      elsif(params.has_key?(:merchant_id))
        @item = Item.find_by(merchant_id: params[:merchant_id])
      else
        @item = Item.find(params[:id])
      end
    end

    def set_items
      if(params.has_key?(:name))
        @items = Item.where(name: params[:name])
      elsif(params.has_key?(:description))
        @items = Item.where(description: params[:description])
      elsif(params.has_key?(:unit_price))
        @items = Item.where(unit_price: params[:unit_price])
      elsif(params.has_key?(:merchant_id))
        @items = Item.where(merchant_id: params[:merchant_id])
      else
        @items = Item.all(params[:id])
      end
    end


end
