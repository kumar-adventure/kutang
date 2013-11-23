class AddUrgentAdToAdvert < ActiveRecord::Migration
  def self.up
    add_column :adverts, :urgent_ad, :boolean, default: false
    add_column :adverts, :top_ad, :boolean, default: false
    add_column :promotes, :urgent_ad, :boolean, default: false
  end

  def self.down
    remove_column :adverts, :urgent_ad
    remove_column :adverts, :top_ad
    remove_column :promotes, :urgent_ad
  end
end
