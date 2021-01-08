class CatalogController < ApplicationController
  before_action :initialize_cart
  
  def index
    @page_title = "Book List"
    @books = Book.paginate(page: params[:page], per_page: 10)
  end

  def show
    @book = Book.find(params[:id]) rescue nil
    return render(:text => "Not found", :status => 404) unless @book
    @page_title = @book.title
  end

  def search
    @page_title = "Search"
    if params[:commit] == "Search" || params[:q]
      @books = Book.where("title LIKE ?", "%" + params[:q] + "%")
      unless @books.size > 0
        flash.now[:notice] = "No books found matching your criteria"
      end
    end
  end

  def latest
    @page_title = "Latest Books"
    @books = Book.latest
  end

end
