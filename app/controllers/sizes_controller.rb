class SizesController < ApplicationController
 def new
  	@size = Size.new
  end

  def index
  	@size = Size.new
  	@sizes = Size.all
  end

  def create
  	@size = Size.new(size_params)
    @size.save
    redirect_to (sizes_path)
  end

  def edit
    @size = Size.find(params[:id])
    @sizes = Size.all
  end

  def update
    @size = Size.find(params[:id])
    @size.update(size_params)
    redirect_to (sizes_path)
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to (sizes_path)
  end

 def show
    @items = if params[:search]
      Item.all.where("yomi_name LIKE?","%#{params[:search]}%")
      else
      Item.all
    end
    @size = Size.find(params[:id])
    @sizes = Size.all
    @categories = Category.all
    @brands = Brand.all
  end

private
	def size_params
	  params.require(:size).permit(:size_name)
	end
end

