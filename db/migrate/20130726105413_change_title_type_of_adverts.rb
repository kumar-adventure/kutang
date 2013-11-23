class ChangeTitleTypeOfAdverts < ActiveRecord::Migration
  def up
    change_column :adverts, :title, :string
    change_column :adverts, :address, :string
  end

  def down
    change_column :adverts, :title, :text
    change_column :adverts, :address, :text
  end
end
