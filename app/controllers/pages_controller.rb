class PagesController < ApplicationController
  before_filter :user_remembered?
  def home

  end

  def thanks
    set_advert_payments
    session[:cart_id] = nil
    session[:order_id] = nil
  end


end