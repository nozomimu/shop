class ItemsController < ApplicationController

  def index
    @item = Item.where(active: 0)
    @q = @item.search(params[:q])
    @items = @q.result(distinct: true)

    #非表示アイテムを表示しない
    @no_item = Item.where(active: 1)
    @no_q = @no_item.search(params[:q])
    @no_items = @no_q.result(distinct: true)
    @sizes = Size.all
    @categories = Category.all
    @brands = Brand.all
  end


  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    if @item.save
       redirect_to items_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      #updateが完了したら一覧ページへリダイレクト
      redirect_to ("/items")
    else
      #updateを失敗すると編集ページへ
      render :edit
    end

  end

  def destroy
    @item = Item.find(params[:id])
    @item.delete
    redirect_to("/items")
  end

  private
    def item_params
        params.require(:item).
        permit(:active,
              :item_name,
              :image,
              :image2,
              :image3,
              :image4,
              :image5,
              :price,
              :item_season,
              :stock,
              :color_id,
              :size_id,
              :category_id,
              :brand_id,
              :color_name,
              :release_date,
              :description)
    end
end
