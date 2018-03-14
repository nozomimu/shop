module ApplicationHelper

	def total_per_order(x)
		total = 0
		x.details.each do |detail|
			y = detail.price * detail.count
			total += y
		end
		return total
	end



end