class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end
	
	def show
		@subcategory = Subcategory.where(:name => params[:name])
	end
end
