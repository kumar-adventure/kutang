class LineItem < ActiveRecord::Base
  attr_accessible :advert_bump_up, :advert_homepage_gallery, :advert_id, :advert_top_ad, :advert_urgent_ad, :cart_id, :order_id
#  attr_accessor :urgent, :bump, :homepage, :top_ad
  belongs_to :cart
  belongs_to :advert
  belongs_to :order

  after_save :delete_if_zero?

  def total_price
    advert_top_ad + advert_urgent_ad + advert_homepage_gallery + advert_bump_up
  end

  def delete_if_zero?
    destroy if self.total_price.zero?
  end

end
