class AddFeaturedAdToAdvert < ActiveRecord::Migration
  def change
    rename_column :adverts, :urgent_ad, :urgent_ads
    add_column :adverts, :carproof_included, :boolean, default: false
    add_column :adverts, :certified_pre_owned, :boolean, default: false
  end
end
