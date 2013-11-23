class Section < ActiveRecord::Base
  attr_accessible :name, :icon, :col
  has_many :categories

  has_many :adverts, through: :categories
  has_many :promotes, through: :adverts
  has_many :subcategories, through: :categories
end
