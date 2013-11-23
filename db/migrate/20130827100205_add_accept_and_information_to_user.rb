class AddAcceptAndInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :terms, :boolean, :default => false
    add_column :users, :information, :boolean, :default => false
  end
end
