class CustomersController < ApplicationController
  before_action :buy_item
  before_action :authenticate_user!
  before_action :sign_up

  def index
    @user_donation = UserDonation.new
  end

  def new
  end
  
  def create
    @user_donation = UserDonation.new(donation_params)
    if @user_donation.valid?
      pay_item
      @user_donation.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
 
  def donation_params
    params.require(:user_donation).permit(:postal, :area_id, :home, :home_number, :building, :number ).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def buy_item
    @item = Item.find(params[:item_id])
    if @item.customer.present?
      redirect_to root_path
    end
  end

  def sign_up
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: donation_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
end
