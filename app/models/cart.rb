class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :line_items
	has_many :items, through: :line_items

	def total
		total = 0
		self.line_items.each do |line_item|
			total += (line_item.item.price * line_item.quantity)
		end
		total
	end

  	def add_item(item_id)
		if self.items.include?(Item.find(item_id))
			@line_item = LineItem.find_by(:item_id => item_id, :cart_id => self.id)
		else
			@line_item = LineItem.new(:item_id => item_id, :cart_id => self.id)
		end
 	end
end
