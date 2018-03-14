class Detail < ApplicationRecord

	belongs_to :user
	belongs_to :item
	belongs_to :order

	enum active:{preparation: 0, shipment: 1}
end
