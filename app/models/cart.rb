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
	    item = line_items.find_by(item_id: item_id)
	    if item
			item.quantity += 1
	    else
			item = line_items.build(item_id: item_id, quantity: 1)
	    end
	    item
 	end
end
