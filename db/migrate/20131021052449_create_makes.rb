class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end
end
