class AddVisitsToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :visits, :integer, default: 0
    remove_column :adverts, :repost
  end
end
