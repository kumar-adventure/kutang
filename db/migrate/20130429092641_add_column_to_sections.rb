class AddColumnToSections < ActiveRecord::Migration
  def change
    add_column :sections, :col, :integer
  end
end
