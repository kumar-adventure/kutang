class SubcategoriesController < ApplicationController
  before_filter :current_location
  before_filter :user_remembered?

  def index
    category = Category.find(params[:category_id])
    @subcategories = category.subcategories.order(:name)

  end

  def show
    @subcategory = Subcategory.find_by_name(params[:id])
    @adverts = @subcategory.adverts.where("location_id =?", session[:current_location]).approved.paginate(page: params[:page], per_page: 20)
    @all_adverts = @adverts.includes(:promotes).where(promotes: {top_ad: false})
    @promotes = @adverts.includes(:promotes).where(:promotes => {:top_ad => true})
  end

end
