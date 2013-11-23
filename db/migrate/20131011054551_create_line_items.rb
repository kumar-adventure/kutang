class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :advert_id
      t.decimal :advert_bump_up, default: 0, precision: 6, scale: 2
      t.decimal :advert_urgent_ad, default: 0, precision: 6, scale: 2
      t.decimal :advert_homepage_gallery, default: 0, precision: 6, scale: 2
      t.decimal :advert_top_ad, default: 0, precision: 6, scale: 2

      t.timestamps
    end
  end
end
