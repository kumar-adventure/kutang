class Category < ActiveRecord::Base
  attr_accessible :name
  CATEGORY = ["Buy and Sell", "Services", "Cars and Vehicles", "Pets", "Community", "Real Estate", "Jobs", "Resumes"]
  has_many :subcategories
end
