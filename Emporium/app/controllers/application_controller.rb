class ApplicationController < ActionController::Base
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find(session[:current_userid]) if session[:current_userid]
  end

  def admin?
    current_user && current_user.username == "admin"
  end

  private

  def initialize_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
