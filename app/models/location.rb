class Location < ActiveRecord::Base
  attr_accessible :name

   has_many :adverts
   has_many :categories, through: :adverts



end
