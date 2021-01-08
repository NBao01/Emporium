class StaticPagesController < ApplicationController
  before_action :authenticate, only: [:favorites]
  before_action :initialize_cart, only: [:favorites]

  def home
    @books = Book.latest
  end

  def about
    @page_title = 'About Emporium'
  end

  def favorites
    @page_title = "Favorites"
    if current_user
      @books = current_user.books
    end
  end
end
