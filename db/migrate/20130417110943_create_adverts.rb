class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.boolean :featured
      t.boolean :approved
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.integer :category_id
      t.integer :location_id
      t.string :phone
      t.string :email
      t.text :address
      t.string :website
      t.string :pricing_strategy

      t.timestamps
    end
  end
end
