class GalleriesController < ApplicationController
	def index
		@products = Product.all
	end
end
