class CategoriesController < ApplicationController
  before_filter :ad_expire?
  before_filter :current_location
  before_filter :user_remembered?
  before_filter :store_location

  def index
    @categories = Category.all
  end

  def show
    adverts = Category.find(params[:id]).adverts if params[:id].present?
    adverts = Section.find(params[:section]).categories.includes(:adverts).where(:adverts => {approved: true}) if params[:section].present?
    adverts = adverts.where("location_id =?", session[:current_location])
    adverts = adverts.where("ad_type =?", params[:ad_type]) if params[:ad_type].present?
    adverts = adverts.where("make =?", params[:make]) if params[:make].present?
    adverts = adverts.where("body_type =?", params[:body_type]) if params[:body_type].present?
    adverts = adverts.where("transmission =?" , params[:transmission]) if params[:transmission].present?
    adverts = adverts.where("color =?" , params[:color]) if params[:color].present?
    adverts = adverts.where("fuel_type =?" , params[:fuel_type]) if params[:fuel_type].present?
    adverts = adverts.where("sale_by =?" , params[:sale_by]) if params[:sale_by].present?
    adverts = adverts.where("price >=? AND price <=?", params[:field1], params[:field2]) if (params[:field1] && params[:field2]).present?
    adverts = adverts.where("#{params[:featured_ad]} =?", true) if params[:featured_ad].present?
    @adverts = adverts.approved.paginate(page: params[:page], per_page: 20)

    @all_adverts = @adverts.includes(:promotes).where(promotes: {top_ad: false})
    @promotes = @adverts.includes(:promotes).where(:promotes => {:top_ad => true})
  end






  def search_by_price
    adverts = adverts.where("price >=? AND price <=?", params[:field1], params[:field2]).approved.paginate(page: params[:page], per_page: 5)
    if @adverts.blank?
      redirect_to store_location, notice: 'Result not found.'
    end
  end

  def search_by_years
    @adverts = Advert.where("location_id =? AND category_id =? AND year >=? AND year <=?", session[:current_location], session[:current_category], params[:field1], params[:field2]).approved.paginate(page: params[:page], per_page: 5)
    if @adverts.blank?
      redirect_to category_path(session[:current_category]), notice: 'Result not found.'
    end
  end

  def search_by_kilometers
    @adverts = Advert.where("location_id =? AND category_id =? AND kilometers >=? AND kilometers <=?", session[:current_location], session[:current_category], params[:field1], params[:field2]).approved.paginate(page: params[:page], per_page: 5)
    if @adverts.blank?
      redirect_to category_path(session[:current_category]), notice: 'Result not found.'
    end
  end

   end







