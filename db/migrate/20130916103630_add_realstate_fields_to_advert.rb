class AddRealstateFieldsToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :bedrooms, :string
    add_column :adverts, :bathrooms, :string
    add_column :adverts, :furnished, :string
    add_column :adverts, :pet_friendly, :string
    add_column :adverts, :size, :string
    add_column :adverts, :sleeps, :string
    add_column :adverts, :vacation_type, :string
    add_column :categories, :urgent_amount, :decimal

    add_column :categories, :bedrooms, :boolean, :default => false
    add_column :categories, :bathrooms, :boolean, :default => false
    add_column :categories, :furnished, :boolean, :default => false
    add_column :categories, :pet_friendly, :boolean, :default => false
    add_column :categories, :size, :boolean, :default => false
    add_column :categories, :sleeps, :boolean, :default => false
    add_column :categories, :vacation_type, :boolean, :default => false
  end
end
