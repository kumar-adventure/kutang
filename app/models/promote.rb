class Promote < ActiveRecord::Base
  attr_accessible :advert_id, :gallery, :gallery_amount, :top_ad, :top_ad_amount, :top_ad_days, :highlight_ad, :highlight_amount, :urgent_ad

  belongs_to :advert
  after_save :set_ad_promotion
  before_create :set_urgent_ad_and_top_ad


  def set_ad_promotion
     self.destroy if self.gallery.nil? && self.top_ad.nil? && self.highlight_ad.nil?
  end

  def set_urgent_ad_and_top_ad
     self.urgent_ad = true if advert.urgent.present?
  end

  def total_price
    amount = 0
    amount += gallery_amount if gallery_amount.present?
    amount += top_ad_amount if top_ad_amount.present?
    amount += highlight_amount if highlight_amount.present?
    amount += advert.category.urgent_amount if advert.category.urgent_amount.present?
    amount
  end

end
