class PagesController < ApplicationController
  def home
    @books = Book.all.shuffle
    @random_books = @books.take(4)
  end

  def about; end

  def contact; end
end
