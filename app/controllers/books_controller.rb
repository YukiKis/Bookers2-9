class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :setup, only: [:index, :show]

  def setup
    @book_new = Book.new
  end

  def index
    @books = Book.paginate(page: params[:page])
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @comment_new = Comment.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      redirect_to @book_new, notice: "successfully made it"
    else
      @books = Book.paginate(page: params[:page])
      @user = current_user
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "successfully made it"
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if current_user == book.user
      book.destroy
      redirect_to user_path(current_user)
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
