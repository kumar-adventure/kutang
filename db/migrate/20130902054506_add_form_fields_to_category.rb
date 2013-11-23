class AddFormFieldsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :phone, :boolean, default: false
    add_column :categories, :pricing, :boolean, default: false
    add_column :categories, :website, :boolean, default: false
    add_column :categories, :ad_type, :boolean, default: false
    add_column :categories, :sale_by, :boolean, default: false
    add_column :categories, :job_type, :boolean, default: false
    add_column :categories, :year, :boolean, default: false
    add_column :categories, :kilometers, :boolean, default: false
    add_column :categories, :trim, :boolean, default: false
    add_column :categories, :body, :boolean, default: false
    add_column :categories, :fuel, :boolean, default: false
    add_column :categories, :transmission, :boolean, default: false
    add_column :categories, :color, :boolean, default: false
    add_column :categories, :drivetrain, :boolean, default: false
    add_column :categories, :make, :boolean, default: false
    add_column :categories, :model, :boolean, default: false
    add_column :categories, :sale_type, :boolean, default: false
    add_column :categories, :engine, :boolean, default: false
    add_column :categories, :event_date_from, :boolean, default: false
    add_column :categories, :event_date_to, :boolean, default: false
    add_column :categories, :event_time_from, :boolean, default: false
    add_column :categories, :event_time_to, :boolean, default: false
    add_column :categories, :promote, :boolean, default: false
    add_column :categories, :gender, :boolean, default: false
    add_column :categories, :frame, :boolean, default: false
    add_column :categories, :brand, :boolean, default: false
    add_column :categories, :carrier, :boolean, default: false
    add_column :categories, :diameter, :boolean, default: false
    add_column :categories, :dob, :boolean, default: false
    add_column :categories, :carproof, :boolean, default: false
    add_column :categories, :header_message, :text
    add_column :categories, :urgent, :boolean, default: false
    add_column :categories, :address, :boolean, default: false


  end
end



