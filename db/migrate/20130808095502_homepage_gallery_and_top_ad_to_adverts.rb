class HomepageGalleryAndTopAdToAdverts < ActiveRecord::Migration
  def up
    add_column :adverts, :homepage_gallery, :boolean
    add_column :adverts, :top_ad, :boolean
  end

  def down
    remove_column :adverts, :homepage_gallery
    remove_column :adverts, :top_ad
  end
end
