class AdminUsersController < ApplicationController
  before_action :authenticate_admin_to_root

	def index
		@users = User.all
	end




# ユーザー管理者用メソッド
  def edit
  end

  def show
    @orders = Order.all
  end

  def show2
    @order_end = Order.where(order_status: 2,order_status: 3)
  end

  def show3
    @order_cancel = Order.where(order_status: 4)
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to orders_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.active = 1#activeカラムを1（削除済）にして、保存
    @user.email = "#{@user.last_sign_in_at.to_i.to_s}_#{@user.email.to_s}"
    if @user.save
      flash[:notice] = "ユーザーの利用を停止しました。"
    end
    redirect_to admin_users_path#リダイレクト先の変更（deviseの初期値　User#index から rootへ変更
  end

  private
  def adminusers_to_users_params
    params.require(:user).permit(
      :email,
      :firstname,
      :lastname,
      :kana_firstname,
      :kana_lastname,
      :postal_code,
      :address,
      :address_more,
      :phone,
      :phone2,
      :phone3)
  end

  def authenticate_admin_to_root
    if !admin_signed_in?
    redirect_to root_path
    end
  end


end