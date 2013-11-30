class Category < ActiveRecord::Base
  attr_accessible :name, :section_id, :gallery_amount, :top_ad3, :top_ad7, :rent, :highlight_price
  attr_accessible :ad_phone, :pricing, :website, :advert_type, :ad_sale_by, :ad_job_type, :ad_year, :ad_kilometers,
                  :ad_trim, :ad_body, :fuel, :ad_trans
  attr_accessible :ad_color, :ad_drivetrain, :ad_make, :ad_model, :ad_sale_type, :engine, :date_from, :date_to,
                  :time_from, :time_to
  attr_accessible :promote, :sex, :frame, :ad_brand, :ad_carrier, :ad_diameter, :ad_dob, :carproof, :header_message,
                  :urgent, :ad_address, :footer_message
  attr_accessible :urgent_amount, :ad_bedrooms, :ad_bathrooms, :ad_size, :ad_furnished, :petfriendly, :ad_sleeps,
                  :ad_vacation

  CATEGORY = ["Buy and Sell", "Services", "Cars and Vehicles", "Pets", "Community", "Real Estate", "Jobs", "Resumes"]

  belongs_to :section
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :adverts, dependent: :destroy
  has_many :locations, through: :adverts

  has_many :subcategories, dependent: :destroy
  has_many :makes, dependent: :destroy
  has_many :models, through: :makes

  def self.rent
    where(rent: true)
  end

  def self.sale
    where(rent: false)
  end

end
