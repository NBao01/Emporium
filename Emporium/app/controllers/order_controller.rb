class OrderController < ApplicationController
  def index
    @status = params[:id] 
    if @status.blank? 
      @orders = Order.paginate(page: params[:page], per_page: 10)
    else 
      @orders = Order.where(:status => @status).paginate(page: params[:page], per_page: 10)
    end 

    @page_title = "Listing #{@status} orders"     
  end

  def show
    @page_title = "Displaying order ##{params[:id]}" 
    @order = Order.find(params[:id]) 
  end

  def close
    order = Order.find(params[:id]) 
    order.close 
    flash[:notice] = "Order #{order.id} has been closed" 
    redirect_to :action => 'index', :id => 'closed' 
  end
end
