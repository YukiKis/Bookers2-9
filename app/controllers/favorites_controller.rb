class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    if !(@book.favorited_by?(current_user))
      favorite = current_user.favorites.new
      favorite.book_id = @book.id
      favorite.save
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    if favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
      favorite.destroy
    end
  end
end
