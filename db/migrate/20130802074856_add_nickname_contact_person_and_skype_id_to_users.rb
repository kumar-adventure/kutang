class AddNicknameContactPersonAndSkypeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :contact_person, :string
    add_column :users, :skype_id, :string
  end
end
