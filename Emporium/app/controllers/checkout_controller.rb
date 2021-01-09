class CheckoutController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :initialize_cart

  def index
    @order = Order.new 
    @page_title = "Checkout" 
    if @cart.books.empty? 
      flash[:notice] = "Your shopping cart is empty! Please add something to it before proceeding to checkout." 
      redirect_back fallback_location: catalog_index_path
    end 
  end

  def place_order
    @page_title = "Checkout" 
    @order = Order.new(order_params) 
    @order.customer_ip = request.remote_ip 
    populate_order 

    if @order.save 
      if @order.process 
        flash[:notice] = 'Your order has been submitted, and will be processed immediately.' 
        session[:order_id] = @order.id 
        # Empty the cart 
        @cart.cart_items.destroy_all 
        redirect_to :action => 'thank_you' 
      else 
        flash[:notice] = "Error while placing order. '#{@order.error_message}'" 
        render :action => 'index' 
      end 
    else 
      render :action => 'index' 
    end 
  end

  def thank_you
    @page_title = 'Thank You!'
  end

  def populate_order 
    for cart_item in @cart.cart_items 
      order_item = OrderItem.new( 
        :book_id => cart_item.book_id, 
        :price => cart_item.price, 
        :amount => cart_item.amount 
      ) 
      @order.order_items << order_item 
    end 
  end 

  def order_params
    params.require(:order).permit(:email, :phone_number, :ship_to_first_name, :ship_to_last_name, :ship_to_address, :ship_to_city, :ship_to_postal_code, :ship_to_country, :customer_ip, :status, :error_message, :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value)
  end
end
