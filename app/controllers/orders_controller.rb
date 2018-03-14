class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@carts = Cart.where(user_id: current_user.id)
		@order = Order.new(order_params)
		@order.user_id = current_user.id
		if @carts.any? {|cart| cart.item.stock < cart.count }
			render :new ,flash: {n:"在庫がないため購入できません。数量をご確認ください。"}
		elsif @order.save
		    @carts.each do |cart|
				cart.item.stock -= cart.count
				cart.item.save

				#cartの内容をdetailへ変換
				@detail = Detail.new(cart.attributes)
				@detail.price = cart.item.price
				@detail.count = cart.count
				@detail.color_id = cart.item.color_id
				@detail.category_id = cart.item.category_id
				@detail.size_id = cart.item.size_id
				@detail.brand_id = cart.item.brand_id
				@detail.saved_price = @total_price
				@detail.order_id = @order.id
				@detail.save
			end
			#カート内容を削除
			@carts.destroy_all
			redirect_to orders_path
		else
			render :new
		end
	end

	def index
	end

	def show
		@orders = Order.all
	end

	def update
		order = Order.find(params[:id])
		order.update(order_params)
		redirect_to in_order_path
	end

	private
	def order_params
		params.require(:order).permit(:lastname,:firstname,:kana_lastname,:kana_firstname,:address,:address_more,:postal_code, :phone,:phone2,:phone3,:order_status,details_attributes:[:user_id,:item_id,:price,:count,:order_id,:active,:color_id,:size_id,:category_id,:brand_id])
	end
end
