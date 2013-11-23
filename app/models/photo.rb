class Photo < ActiveRecord::Base
   attr_accessible :image, :advert_id
   has_attached_file :image, :styles => { :large => "800x600>", :medium => "350x200>", :thumb => "70x58>" }

   belongs_to :advert, dependent: :destroy

end
