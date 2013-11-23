class AddGalleryTopAdAmountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :gallery_amount, :decimal
    add_column :categories, :top_ad3, :decimal
    add_column :categories, :top_ad7, :decimal
  end
end
