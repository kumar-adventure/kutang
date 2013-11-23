class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    change_column :users, :phone, :string
    change_column :adverts, :phone, :string
  end
end
