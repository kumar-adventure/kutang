module ApplicationHelper
  require 'addressable/uri'

  def active_link_to(*args, &block)
    if request.path == args[1]
      args << {class: "active"}
    end
    link_to(*args, &block)
  end

  def section_links(section)
    adverts = section.adverts.where(:location_id => session[:current_location])
    adverts = adverts.where("ad_type =?", params[:ad_type]) if params[:ad_type].present?
    adverts = adverts.where("#{params[:featured_ad]} =?", true) if params[:featured_ad].present?
    adverts = adverts.where("price >=?", params[:field1].to_i) if (params[:field1]).present?
    adverts = adverts.where("price <=?", params[:field2].to_i) if (params[:field2]).present?
    link_to "#{section.name} (#{adverts.approved.count})", section_path(section.id)+"#{url_string}" if adverts.approved.present?
  end

  def url_string
    request.fullpath.include?('?') ? request.fullpath.slice(request.fullpath.index('?'), request.fullpath.length) : nil
  end

  def category_links(category)
    adverts = category.adverts.where(:location_id => session[:current_location])
    adverts = adverts.where("ad_type =?", params[:ad_type]) if params[:ad_type].present?
    adverts = adverts.where("#{params[:featured_ad]} =?", true) if params[:featured_ad].present?
    adverts = adverts.where("price >=?", params[:field1].to_i) if (params[:field1]).present?
    adverts = adverts.where("price <=?", params[:field2].to_i) if (params[:field2]).present?
    link_to "#{category.name} (#{adverts.approved.count})", section_path(category.section_id, category_id: category.id)+"#{category_url_string}" if adverts.approved.present?
  end

  def category_url_string
    request.fullpath.include?('?') ? "&#{request.fullpath.slice(request.fullpath.index('?') +1, request.fullpath.length)}" : nil
  end

  def form_location
    @subcategory.present? ? [@subcategory, @advert] : [@category, @advert]
  end

  def expire_ads(advert)
    if(advert.expire_date.to_datetime - Time.zone.today).round.between?(1, 2)
      link_to image_tag("repost.jpg", align: "absmiddle"), repost_path(id: advert), method: :put
    end
  end

  def promotion_required?(advert)
    unless advert.urgent_ads.present? || advert.top_ad.present? || advert.homepage_ads.present? || advert.bump_up_ads.present?
        link_to image_tag("promote.jpg", align: "absmiddle", style: "width: 58px; height: 24px; margin-right: 4px;"), promote_my_ads_path
    end
  end

  def active?
    current_user.adverts.where(accept: true, approved: true).count
  end

  def expired?
    current_user.adverts.where(expire: true).count
  end

  def pending?
    current_user.adverts.where(approved: false, accept: true).count
  end

  def onhold?
    current_user.adverts.where(accept: false).count
  end

  def subcategories_present?(category)
    if Subcategory.find_by_category_id(category)
      link_to category.name, subcategories_path(category_id: category)
    else
      link_to category.name, new_category_advert_path(category)
    end
  end



  def activated_link(adverts, str1, str2)
    request.url.include?("#{str1}")? "<strong class='orange'>#{str2} (#{adverts.where("#{str1}=?", str2).count})</strong>" : (link_to "#{str2} (#{adverts.where("#{str1}=?", str2).count})",  (request.fullpath + (request.url.include?('?') ? '&' : '?') + "#{str1}=#{str2}"))
  end

  def filter_header_link(str1, str2)
    uri = Addressable::URI.parse("#{request.fullpath}")
    if request.url.include?(str2)
      params = uri.query_values
      params.delete(str2)
      uri.query_values = params
      link_to str1, uri.to_s
    else
       "<strong class='orange'> #{str1}</strong>"
    end
  end

  def featured_ads(adverts, str1, str2)
    request.url.include?("#{str1}")? "<strong class='orange'>#{str2.split('_').join(' ').capitalize} (#{adverts.where("#{str2}=?", true).count})</strong>" : (link_to "#{str2} (#{adverts.where("#{str2}=?", true).count})".split('_').join(' ').capitalize,  (request.fullpath + (request.url.include?('?') ? '&' : '?') + "#{str1}=#{str2}"))
  end

  def all_categories_link(str1, str2, str3)
    uri = Addressable::URI.parse("#{str3}")
    if request.url.include?(str2)
      params = uri.query_values
      params.delete(str2)
      uri.query_values = params
      link_to str1, all_categories_path() + uri.to_s
    else
      link_to str1, all_categories_path() + str3.to_s
    end
  end


  def link_to_order
    session[:order_id].present? ? link_to( image_tag("paynow.jpg", align: "absmiddle", style: "width: 75px; height: 26px; margin: 10px"), order_path(id: session[:order_id]), method: :put) : link_to( image_tag("paynow.jpg", align: "absmiddle", style: "width: 75px; height: 26px; margin: 10px"), orders_path, method: :post)
  end



end
