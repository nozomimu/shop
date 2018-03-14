class Item < ApplicationRecord

	attachment :image
	attachment :image2
	attachment :image3
	attachment :image4
	attachment :image5
	has_many :histories
	has_many :carts
	belongs_to :category
	belongs_to :brand
	belongs_to :color


	enum active: { display: 0, hide: 1}

end
