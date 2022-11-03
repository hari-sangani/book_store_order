class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  # GET /books or /books.json
  def index
    if params.has_key?(:language)
      @pagy, @books = pagy(Book.where(language: params[:language]), items: 9)
    elsif params.has_key?(:min) && params.has_key?(:max)
      @pagy, @books = pagy(Book.between_range(params[:min], params[:max]), items: 9)
    elsif params.has_key?(:publisher)
      @pagy, @books = pagy(Book.show_publisher(params[:publisher]), items: 9)
    elsif params.has_key?(:category)
      @pagy, @books = pagy(Book.show_category(params[:category]), items: 9)
    elsif params.has_key?(:author)
      @pagy, @books = pagy(Book.show_author(params[:author]), items: 9)
    elsif params.has_key?(:query)
      @pagy, @books = pagy(Book.where('title LIKE ?', '%' + params[:query] + '%'), items: 9)
    else
      @pagy, @books = pagy(Book.all, items: 9)
    end
  end

  # GET /books/1 or /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
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
    params.require(:book).permit(:publisher_id, :title, :image, :isbndb, :publish_date, :language, :mrp, :discount, :price,
                                 :paperback, :quantity, :active)
  end
end
