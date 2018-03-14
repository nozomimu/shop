class Order < ApplicationRecord
	has_many :details
	belongs_to :user

	enum order_status: { in_ordered: 0, preparation: 1, in_delivery: 2, finish: 3, cancel: 4}
end
