class AddGalleryAndBumpUpToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :homepage_ads, :boolean, default: false
    add_column :adverts, :bump_up_ads, :boolean, default: false
    add_column :adverts, :urgent, :boolean, default: false
  end
end
