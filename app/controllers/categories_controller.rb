class CategoriesController < ApplicationController
   def new
  	@category = Category.new
  end

  def index
  	@category = Category.new
  	@categories = Category.all
  end

  def create
  	@category = Category.new(category_params)
    @category.save
    redirect_to (categories_path)
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to (categories_path)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to (categories_path)
  end

  def show
    @items = if params[:search]
      Item.all.where("yomi_name LIKE?","%#{params[:search]}%")
      else
      Item.all
    end
    @sizes = Size.all
    @category = Category.find(params[:id])
    @categories = Category.all
    @brands = Brand.all
  end

private
	def category_params
	  params.require(:category).permit(:name)
	end
end