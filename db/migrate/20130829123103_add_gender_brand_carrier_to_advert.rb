class AddGenderBrandCarrierToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :gender, :string
    add_column :adverts, :frame_size, :string
    add_column :adverts, :brand, :string
    add_column :adverts, :carrier, :string
  end
end
