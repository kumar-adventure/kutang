class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :name
  attr_accessible :pricing, :ad_type, :sale_by, :year, :kilometers, :color, :make, :model, :engine
  attr_accessible :gender, :frame, :brand, :carrier, :diameter

  belongs_to :category
  has_many :adverts
end
