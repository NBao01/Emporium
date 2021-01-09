class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :initialize_cart
  before_action :authenticate, only: [:like, :unlike]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def like
    @book.users << current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: catalog_index_path, notice: @book.title + ' is added to your favorites' }
      format.json { head :no_content }
    end
  end

  def unlike
    @book.users.delete(current_user)
    respond_to do |format|
      format.html { redirect_back fallback_location: catalog_index_path, notice: @book.title + ' is removed from your favorites' }
      format.json { head :no_content }
    end
  end

  # GET /books
  # GET /books.json
  def index
    @page_title = "Books"
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @page_title = @book.title
  end

  # GET /books/new
  def new
    @page_title = "New Book"
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @page_title = "Editing Book"
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    #for author_id in params[:authors_ids]
    #  @book.authors << Author.find(author_id)
    #end

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, {:author_ids => []}, :publisher_id, :published_at, :category_id, :isbn, :blurb, :page_count, :price)
    end
end
