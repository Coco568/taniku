class PictureBooksController < ApplicationController
  def index
    @picture_books = PictureBook.all
  end

  private


end
