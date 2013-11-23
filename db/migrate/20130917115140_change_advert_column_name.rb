class ChangeAdvertColumnName < ActiveRecord::Migration
  def up
    rename_column :adverts, :type, :vehicle_type
  end

  def down
    rename_column :adverts, :vehicle_type, :type
  end
end
