class DetailController < ApplicationController
	def update
		detail = Detail.find(params[:id])
		detail.update(detail_params)
		redirect_to admin_user_show_path(detail.user_id)
	end

	private
	def detail_params
		params.require(:detail).permit(:user_id,:item_id,:price,:count,:order_id,:active)
	end
end
