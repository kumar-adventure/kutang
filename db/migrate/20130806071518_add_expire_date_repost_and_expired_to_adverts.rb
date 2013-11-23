class AddExpireDateRepostAndExpiredToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :expire_date, :datetime
    add_column :adverts, :expire, :boolean
    add_column :adverts, :repost, :boolean
  end
end
