class AddFieldsToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :ad_type, :string
    add_column :adverts, :sale_by, :string
    add_column :adverts, :job_type, :string
  end
end
