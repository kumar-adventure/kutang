class Order < ActiveRecord::Base
  attr_accessible :user_id

  has_many :line_items
  belongs_to :user


  after_create :remove_line_items_without_order

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      line_items << item
    end
  end

  def total_price
    line_items.to_a.sum {|item| item.total_price}
  end

  def remove_line_items_without_order
    LineItem.all.each do |item|
      item.destroy if item.order_id.nil?
    end
  end

end
