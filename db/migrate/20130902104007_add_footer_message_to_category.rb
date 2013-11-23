class AddFooterMessageToCategory < ActiveRecord::Migration
  def change
    add_column :subcategories, :ad_type, :boolean, default: false
    add_column :subcategories, :pricing, :boolean, default: false
    add_column :subcategories, :gender, :boolean, default: false
    add_column :subcategories, :diameter, :boolean, default: false
    add_column :subcategories, :sale_by, :boolean, default: false
    add_column :subcategories, :make, :boolean, default: false
    add_column :subcategories, :model, :boolean, default: false
    add_column :subcategories, :kilometers, :boolean, default: false
    add_column :subcategories, :color, :boolean, default: false
    add_column :subcategories, :engine, :boolean, default: false
    add_column :subcategories, :year, :boolean, default: false
    add_column :subcategories, :frame, :boolean, default: false
    add_column :subcategories, :brand, :boolean, default: false
    add_column :subcategories, :carrier, :boolean, default: false

    add_column :categories ,:footer_message, :text
  end
end
