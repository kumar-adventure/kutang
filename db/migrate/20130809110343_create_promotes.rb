class CreatePromotes < ActiveRecord::Migration
  def change
    create_table :promotes do |t|
      t.integer :advert_id
      t.boolean :top_ad
      t.integer :top_ad_days
      t.decimal :top_ad_amount
      t.boolean :gallery
      t.decimal :gallery_amount


      t.timestamps
    end
  end
end
