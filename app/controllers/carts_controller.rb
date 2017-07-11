class CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
		@user = current_user
	end

	def checkout
		@cart = Cart.find(params[:id])
		@cart.checkout
		current_user.current_cart_id = nil
		current_user.save
		redirect_to cart_path(@cart)
	end
end
