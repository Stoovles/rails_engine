class Api::V1::ItemsController < ApplicationController
  include Randomness
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

  def serializer
    ItemSerializer
  end

  def model_object
    Item
  end

  private
    def set_item
      if(params.has_key?(:name))
        @item = Item.find_by(name: params[:name])
      elsif(params.has_key?(:description))
        @item = Item.find_by(description: params[:description])
      elsif(params.has_key?(:unit_price))
        @item = Item.find_by(unit_price: (params[:unit_price].to_f*100).round)
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
        @items = Item.where(unit_price: (params[:unit_price].to_f*100).round)
      elsif(params.has_key?(:merchant_id))
        @items = Item.where(merchant_id: params[:merchant_id])
      elsif(params.has_key?(:id))
        @items = Item.where(id: params[:id])
      else
        @items = Item.all
      end
    end


end
