class StaticPagesController < ApplicationController
  def home
  end

  def about
    @page_title = 'About Emporium'
  end
end
