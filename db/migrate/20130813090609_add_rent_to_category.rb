class AddRentToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :rent, :boolean, default: false

  end
end
