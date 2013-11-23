class LineItemsController < ApplicationController

  def create
    advert = Advert.find(params[:advert])
    @line_item = current_cart.line_items.new(:advert_id => advert.id)
    @line_item.advert_bump_up = params[:line_item][:advert_bump_up] if params[:bump].present?
    @line_item.advert_urgent_ad = params[:line_item][:advert_urgent_ad] if params[:urgent].present?
    @line_item.advert_homepage_gallery = params[:line_item][:advert_homepage_gallery] if params[:homepage].present?
    @line_item.advert_top_ad = params[:line_item][:advert_top_ad] if params[:top_ad].present?
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to promote_my_ads_path }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.advert_bump_up = params[:bump].present? ?  params[:line_item][:advert_bump_up] : @line_item.advert_bump_up = 0
    @line_item.advert_urgent_ad = params[:urgent].present? ? params[:line_item][:advert_urgent_ad] : @line_item.advert_urgent_ad = 0
    @line_item.advert_homepage_gallery = params[:homepage].present? ? params[:line_item][:advert_homepage_gallery] : @line_item.advert_homepage_gallery = 0
    @line_item.advert_top_ad = params[:top_ad].present? ? params[:line_item][:advert_top_ad] : @line_item.advert_top_ad = 0
    @line_item.save
    redirect_to promote_my_ads_path
  end


end
