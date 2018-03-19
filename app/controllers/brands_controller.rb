class BrandsController < ApplicationController
 def new
  	@brand = Brand.new
  end

  def index
  	@brand = Brand.new
  	@brands = Brand.all
  end

  def create
  	@brand = Brand.new(brand_params)
    @brand.save
    redirect_to (brands_path)
  end

  def edit
    @brand = Brand.find(params[:id])
    @brands = Brand.all
  end

  def update
    @brand = Brand.find(params[:id])
    @brand.update(Brand_params)
    redirect_to (brands_path)
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to (brands_path)
  end

   def show
    @items = if params[:search]
      Item.all.where("yomi_name LIKE?","%#{params[:search]}%")
      else
      Item.all
    end
    @sizes = Size.all
    @categories = Category.all
    @brand = Brand.find(params[:id])
    @brands = Brand.all
  end

private
	def brand_params
	  params.require(:brand).permit(:brand_name)
	end
end
