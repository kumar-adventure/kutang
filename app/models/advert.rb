class Advert < ActiveRecord::Base
  attr_accessible :address, :approved, :category_id, :description, :email, :featured, :location_id, :phone, :price,
    :pricing_strategy, :title, :website, :user_id
  attr_accessible :ad_type, :sale_by, :job_type, :year, :kilometers, :trim, :body_type, :fuel_type, :transmission, 
    :color, :drivetrain, :make
  attr_accessible :model, :vehicle_type, :engine_displacement, :event_date_from, :event_date_to, :event_time_from,
    :event_time_to, :expire_date
  attr_accessible :expire, :visits, :accept, :photos_attributes, :subcategory_id, :gender, :frame_size, :brand, :carrier
  attr_accessible :bedrooms, :bathrooms, :size, :furnished, :pet_friendly, :sleeps, :vacation_type, :urgent_ads,
    :carproof_included, :certified_Pre_Owned
  attr_accessible :vin, :report_url, :stock, :diameter, :dob, :top_ad, :promotes_attributes, :urgent, :bump_up_ads,
    :homepage_ads

  belongs_to :location
  belongs_to :category
  belongs_to :user
  belongs_to :subcategory

  has_many :photos
  accepts_nested_attributes_for :photos, allow_destroy: true

  has_many :promotes
  accepts_nested_attributes_for :promotes, allow_destroy: true

  has_many :line_items

  def ad_job_type?
    category.ad_job_type.eql?(true) ? true : false
  end

  before_save :set_price_value
  before_create :set_expire_date



# after_save :set_ad_promotion
  def self.featured
    where(featured: true)
  end

  def self.unapproved
    where("approved = ? or approved is ?", false, nil)
  end

  def self.approved
    where("approved = ? AND accept = ?", true, true)
  end

  def set_expire_date
    self.expire_date = Time.now + 60.days
  end

  def add_visitor
    self.visits = self.visits += 1
    save
  end

  private

  def set_ad_promotion
    self.promotes.all.each do |p|
      p.destroy if !p.gallery
    end
  end

  def set_price_value
    if pricing_strategy == "Price" && price.blank?
      self.pricing_strategy =  "Please Contact"
    end
  end

end
