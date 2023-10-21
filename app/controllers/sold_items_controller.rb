class SoldItemsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_data, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @sold_address = SoldAddress.new
    return unless SoldItem.exists?(item_id: @item.id) || @item.user_id == current_user.id

    redirect_to root_path
  end

  def create
    @sold_address = SoldAddress.new(sold_params)
    if @sold_address.valid?
      pay_item
      @sold_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def sold_params
    params.require(:sold_address).permit(:post_code, :region_id, :city, :street_address, :building_name, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: sold_params[:token],
      currency: 'jpy'
    )
  end

  def item_data
    @item = Item.find(params[:item_id])
  end

end
