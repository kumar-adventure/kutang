class AddAcceptToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :accept, :boolean
  end
end
