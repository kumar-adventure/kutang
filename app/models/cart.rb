class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum {|line| line.total_price }
  end
end

