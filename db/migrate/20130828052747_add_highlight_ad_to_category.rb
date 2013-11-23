class AddHighlightAdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :highlight_price, :decimal
  end
end
