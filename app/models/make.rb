class Make < ActiveRecord::Base
  attr_accessible :category_id, :title

  belongs_to :category
  has_many :models

  validates_uniqueness_of :title

end
