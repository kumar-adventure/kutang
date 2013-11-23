class AddMultipleFieldsInAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :year, :integer
    add_column :adverts, :kilometers, :decimal
    add_column :adverts, :trim, :string
    add_column :adverts, :body_type, :string
    add_column :adverts, :transmission, :string
    add_column :adverts, :color, :string
    add_column :adverts, :drivetrain, :string
    add_column :adverts, :make, :string
    add_column :adverts, :model, :string
    add_column :adverts, :type, :string
    add_column :adverts, :fuel_type, :string
    add_column :adverts, :engine_displacement, :integer
    add_column :adverts, :event_date_from, :date
    add_column :adverts, :event_date_to, :date
    add_column :adverts, :event_time_from, :time
    add_column :adverts, :event_time_to, :time
  end


end
