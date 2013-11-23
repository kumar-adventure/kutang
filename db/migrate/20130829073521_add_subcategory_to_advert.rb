class AddSubcategoryToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :subcategory_id, :integer
  end
end
