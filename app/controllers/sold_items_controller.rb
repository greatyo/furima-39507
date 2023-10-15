class SoldItemsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sold_address = SoldAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sold_address = SoldAddress.new(sold_params)
    if @sold_address.valid?
      @sold_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def sold_params
    params.require(:sold_address).permit(:post_code, :region_id, :city, :street_address, :building_name, :telephone, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

end