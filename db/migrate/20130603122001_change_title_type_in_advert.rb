class ChangeTitleTypeInAdvert < ActiveRecord::Migration
  def change
    change_column :adverts, :title, :text
  end
end
