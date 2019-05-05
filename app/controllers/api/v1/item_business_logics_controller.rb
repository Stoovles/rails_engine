class Api::V1::ItemBusinessLogicsController < ApplicationController


  def show
    # @item = Item.find(params[:id])
    # render json: BestDaySerializer.new(@item.best_day)
  end


  def index
    if request.path.include?("/most_revenue")
      @items = Item.top_revenue(params[:quantity])
      render json: ItemSerializer.new(@items)
    elsif request.path.include?("/most_items")
      @items = Item.top_quantity_sold(params[:quantity])
      render json: ItemSerializer.new(@items)
    end
  end



end
