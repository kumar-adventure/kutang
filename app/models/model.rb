class Model < ActiveRecord::Base
  attr_accessible :make_id, :title

  belongs_to :make
end
