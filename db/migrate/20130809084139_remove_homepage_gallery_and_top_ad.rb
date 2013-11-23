class RemoveHomepageGalleryAndTopAd < ActiveRecord::Migration
  def up
    remove_column :adverts, :homepage_gallery
    remove_column :adverts, :top_ad
  end

  def down
    add_column :adverts, :homepage_gallery, :boolean
    add_column :adverts, :top_ad, :boolean
  end
end
