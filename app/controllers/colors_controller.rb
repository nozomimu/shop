class ColorsController < ApplicationController
  def new
  	@color = Color.new
  end

  def index
  	@color = Color.new
  	@colors = Color.all
  end

  def create
  	@color = Color.new(color_params)
    @color.save
    redirect_to (colors_path)
  end

  def edit
    @color = Color.find(params[:id])
    @colors = color.all
  end

  def update
    @color = Color.find(params[:id])
    @color.update(color_params)
    redirect_to (colors_path)
  end

  def destroy
    @color = Color.find(params[:id])
    @color.destroy
    redirect_to (colors_path)
  end

private
	def color_params
	  params.require(:color).permit(:color_name)
	end
end
