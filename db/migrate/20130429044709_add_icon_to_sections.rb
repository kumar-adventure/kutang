class AddIconToSections < ActiveRecord::Migration
  def change
    add_column :sections, :icon, :string
  end
end
