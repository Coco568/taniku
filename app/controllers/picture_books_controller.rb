class PictureBooksController < ApplicationController
  before_action :set_picture_book_params, only: %i[edit update destroy]
  def index
    @picture_books = current_user.picture_books.all
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

  def edit; end

  def show
    @picture_book = PictureBook.find(params[:id])
  end

  def update
    if @picture_book.update(picture_book_params)
      redirect_to picture_books_path, success: '図鑑を更新しました!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @picture_book.destroy!
    redirect_to picture_books_path, success: "図鑑のデータを削除しました!"
  end

  private

  def picture_book_params
    params.require(:picture_book).permit(:breed, :price, :shop, :picture, :picture_cache, :purchase_date)
  end

  def set_picture_book_params
    @picture_book = current_user.picture_books.find(params[:id])
  end
end
