class OrdersController < ApplicationController
  include ActiveMerchant::Billing::Integrations

  def show
    session[:order_id].present? ? @order = Order.find(session[:order_id]) : (redirect_to root_url)
  end

  def create
    @order = Order.new(user_id: current_user.id)
    @order.add_line_items_from_cart(current_cart)
    @order.save
    session[:order_id] = @order.id
      redirect_to @order, notice: 'Order was successfully created.'
  end

  def update
    @order = Order.find(session[:order_id])
    @order.add_line_items_from_cart(current_cart)
    @order.save
    redirect_to @order, notice: "Order updated"
  end



end
