class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  protect_from_forgery

  helper_method :homepage?
  helper_method :logged_in?
  helper_method :current_user
  helper_method :count_adverts
  helper_method :current_location
  helper_method :user_remembered?
  helper_method :current_cart
  helper_method :set_form_value




  def homepage?
    request.path == "/home" || request.path == "/"
  end

  def logged_in?
    current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])  if session[:user_id].present?
  end

  def login_required
    redirect_to login_url, :alert => "Not authorized" if current_user.nil?
  end

  def admin?
    current_user && current_user.admin?
  end

  def admin_required
    unless admin?
      store_target_location
      redirect_to login_url, :alert => "You are not authorized for this page."
    end
  end

  def store_target_location
    session[:return_to] = request.url
  end

  def user_required
    unless current_user
      redirect_to login_url, notice: 'Log in first.'
    end
  end

  def user_remembered?
     session[:user_id] = User.find_by_token(cookies[:auth_token]).id  if cookies[:auth_token].present?
  end

  def ad_expire?
    Advert.all.each do |advert|
      if (advert.expire_date.to_datetime - Time.zone.today).round <= 0
        advert.update_attributes(expire: true, approved: false)
      end
    end
  end

  def count_adverts
    @user = current_user.adverts.count
  end

  def store_location
      session[:current_url] = request.fullpath
  end

  def verify_password(current, new, confirm)
     current_user.password != current ? current_user.errors.add(current, "doesn't match") : true
  end

  def current_location
    #session[:current_location] = Location.first.id if session[:current_location].nil?
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def set_advert_payments
    current_cart.line_items.each do |item|
      item.advert.bump_up_ads = true if item.advert_bump_up.nonzero?
      item.advert.homepage_ads = true if item.advert_homepage_gallery.nonzero?
      item.advert.urgent_ads = true if item.advert_urgent_ad.nonzero?
      item.advert.top_ad = true if item.advert_top_ad.nonzero?
      item.advert.save
    end
  end

  def set_form_value(advert)
    current_cart.line_items.find_by_advert_id(advert).present? ? (current_cart.line_items.find_by_advert_id(advert)) : current_cart.line_items.new()
  end



  def top_and_promote_ads
    current_user.adverts.approved.each do |ad|
        (Date.today - (ad.line_items.where('advert_top_ad >= ?', 1)).last.created_at.to_date).round < ad.promotes.last.top_ad_days && (ad.line_items.where('advert_top_ad >= ?', 1)).last.order_id.present? ? ad.top_ad = true  : ad.top_ad = false  if (ad.line_items.where('advert_top_ad >= ?', 1)).present?
        (Date.today - (ad.line_items.where('advert_urgent_ad >= ?', 1)).last.created_at.to_date).round < 7 && (ad.line_items.where('advert_urgent_ad >= ?', 1)).last.order_id.present? ? ad.urgent_ads = true  : ad.urgent_ads = false  if (ad.line_items.where('advert_urgent_ad >= ?', 1)).present?
        (Date.today - (ad.line_items.where('advert_homepage_gallery >= ?', 1)).last.created_at.to_date).round < 7 && (ad.line_items.where('advert_homepage_gallery >= ?', 1)).last.order_id.present? ? ad.homepage_ads = true  : ad.homepage_ads = false  if (ad.line_items.where('advert_homepage_gallery >= ?', 1)).present?
        ad.save
    end  if current_user.present?
  end

  def validate_form_fields(advert, form)
    result = false

    (advert.errors.add(:job_type, "can't be blank."); result = true) if form.include?('job_type') && form[:job_type].blank?

    (advert.errors.add(:price, "can't be blank."); result = true) if form.include?('pricing_strategy').present? && form[:pricing_strategy]=='Price' && form[:price].empty?

#    (advert.errors.add(:price, "should be number."); result = true) if form[:pricing_strategy]=='Price' && form[:price].to_s && !form[:price].empty?

    (advert.errors.add("Offered/Sale", " by must be selected."); result = true) if form.include?('sale_by') && form[:sale_by].blank?

    (advert.errors.add("Please select your Product", " brand."); result = true) if form.include?('brand') && form[:brand].blank?

    (advert.errors.add("Please select your Product", " carrier."); result = true) if form.include?('carrier') && form[:carrier].blank?

    (advert.errors.add("Please select your vehicle", " make"); result = true) if form.include?('make') && form[:make].blank?

    (advert.errors.add("Please select your vehicle", " model."); result = true) if form.include?('model') && form[:model].blank?

    (advert.errors.add(:year, "can't be blank."); result = true) if form.include?('year').present? && form[:year].empty?

#    (advert.errors.add("Invalid" , "year."); result = true) if form.include?('year').present? && form[:year].to_s && !form[:year].empty?

    (advert.errors.add(:kilometers, "can't be blank."); result = true) if form.include?('kilometers').present? && form[:kilometers].empty?

#    (advert.errors.add("Invalid", " kilometers."); result = true) if form.include?('kilometers').present? && form[:kilometers].to_s && !form[:kilometers].empty?

    (advert.errors.add("Please select vehicle", " body type."); result = true) if form.include?('body_type') && form[:body_type].blank?

    (advert.errors.add(:title, "can't be blank."); result = true) if form.include?('title') && form[:title].blank?

    (advert.errors.add(:description, "can't be blank."); result = true) if form.include?('description') && form[:description].blank?

    (advert.errors.add(:email, "can't be blank."); result = true) if form.include?('email') && form[:email].blank?

    (advert.errors.add(:email, "is invalid."); result = true) if form.include?('email') && !form[:email].blank? && /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i.match("#{form[:email]}").nil?

    (advert.errors.add(:address, "can't be blank."); result = true) if form.include?('address') && form[:address].blank?

    result
  end

end