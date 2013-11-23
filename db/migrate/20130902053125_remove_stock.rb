class RemoveStock < ActiveRecord::Migration
  def up
    add_column :adverts, :stock, :string
    add_column :adverts, :vin, :string
    add_column :adverts, :report_url, :string
    add_column :adverts, :carproof, :string
    add_column :adverts, :dob, :date
  end

  def down
    remove_column :adverts, :stock
    remove_column :adverts, :vin
    remove_column :adverts, :report_url
    remove_column :adverts, :carproof
    remove_column :adverts, :dob
  end
end
