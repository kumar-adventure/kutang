class SetDefalultApprovalFalseToAdvert < ActiveRecord::Migration
  def up
    change_column :adverts, :approved, :boolean, :default => false
  end

  def down
    change_column :adverts, :approved, :boolean
  end
end
