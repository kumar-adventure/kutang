class AddHighlightAndHighlightAmountToPromote < ActiveRecord::Migration
  def change
    add_column :promotes, :highlight_ad, :boolean, default: false
    add_column :promotes, :highlight_amount, :decimal
  end
end
