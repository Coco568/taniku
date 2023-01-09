class PictureBooksController < ApplicationController
  def index
    @picture_books = PictureBook.all
  end

  def new
    @picture_book = PictureBook.new
  end

  def create
    @picture_book = current_user.picture_books.build(picture_book_params)
    if @picture_book.save
      redirect_to picture_books_path, success: '図鑑へ登録しました!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def picture_book_params
    params.require(:picture_book).permit(:breed, :price, :shop, :picture, :purchase_date)
  end
end
