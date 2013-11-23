class SectionsController < ApplicationController
  before_filter :ad_expire?
  before_filter :current_location
  before_filter :user_remembered?
  before_filter :store_location
  before_filter :top_and_promote_ads

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
    adverts = @section.adverts
    adverts = adverts.where("title ILIKE '%#{params[:text1]}%'") if params[:text1].present?
    adverts = Category.find(params[:category_id]).adverts if params[:category_id].present?
    adverts = adverts.where("location_id =?", session[:current_location])
    adverts = adverts.where("ad_type =?", params[:ad_type]) if params[:ad_type].present?
    adverts = adverts.where("make =?", params[:make]) if params[:make].present?
    adverts = adverts.where("body_type =?", params[:body_type]) if params[:body_type].present?
    adverts = adverts.where("transmission =?" , params[:transmission]) if params[:transmission].present?
    adverts = adverts.where("color =?" , params[:color]) if params[:color].present?
    adverts = adverts.where("fuel_type =?" , params[:fuel_type]) if params[:fuel_type].present?
    adverts = adverts.where("sale_by =?" , params[:sale_by]) if params[:sale_by].present?
    adverts = adverts.where("price >=?", params[:field1].to_i) if (params[:field1]).present?
    adverts = adverts.where("price <=?", params[:field2].to_i) if (params[:field2]).present?
    adverts = adverts.where("kilometers >=?", params[:field3].to_i) if (params[:field3]).present?
    adverts = adverts.where("kilometers <=?", params[:field4].to_i) if (params[:field4]).present?
    adverts = adverts.where("year >=?", params[:field5].to_i) if (params[:field5]).present?
    adverts = adverts.where("year <=?", params[:field6].to_i) if (params[:field6]).present?
    adverts = adverts.where("#{params[:featured_ad]} =?", true) if params[:featured_ad].present?
    adverts = adverts.where("top_ad =?", true) if params[:top_ad].present?
    @adverts = adverts.approved.paginate(page: params[:page], per_page: 20)

    @all_adverts = @adverts.where(top_ad: false)
    @promotes = @adverts.where(top_ad: true)

  end

  def select_category
    @sections = Section.all
  end

    def all_categories
    @sections = Section.all
    adverts = @sections.collect {|x| x.adverts.all}
    adverts = Advert.where('location_id = ?', session[:current_location]).approved.paginate(page: params[:page], per_page: 20)
    adverts = Category.find(params[:category_id]).adverts if params[:category_id].present?
    adverts = adverts.where("ad_type =?", params[:ad_type]) if params[:ad_type].present?
    adverts = adverts.where("#{params[:featured_ad]} =?", true) if params[:featured_ad].present?
    adverts = adverts.where("price >=?", params[:field1].to_i) if (params[:field1]).present?
    adverts = adverts.where("price <=?", params[:field2].to_i) if (params[:field2]).present?
    @adverts = adverts.approved.paginate(page: params[:page], per_page: 20)

    @all_adverts = @adverts.where(top_ad: false)
    @promotes = @adverts.where(top_ad: true)
  end

  def search_by_price
    @adverts = Advert.where("location_id =? AND price >=? AND price <=?", session[:current_location], params[:field1], params[:field2]).approved.paginate(page: params[:page], per_page: 5)
    @all_adverts = @adverts.includes(:promotes).where(promotes: {top_ad: false})
    @promotes = @adverts.includes(:promotes).where(:promotes => {:top_ad => true})
    if @adverts.blank?
      redirect_to store_location, notice: 'Result not found.'
    end
  end


end