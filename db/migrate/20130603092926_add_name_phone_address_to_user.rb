class AddNamePhoneAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :address, :text
  end
end
