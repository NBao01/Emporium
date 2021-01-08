class ApplicationController < ActionController::Base
  helper_method :current_user, :admin?

  def current_user
    @current_user ||= User.find(session[:current_userid]) if session[:current_userid]
  end

  def admin?
    current_user && current_user.username == "admin"
  end

  def authenticate
    redirect_to login_users_url, alert: 'Please login to continue.' unless current_user
  end

  def authenticate_admin
    redirect_back fallback_location: home_path, alert: 'Administrator Authority Needed!' unless admin?
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
