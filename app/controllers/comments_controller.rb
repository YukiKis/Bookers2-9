class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @comment_new = current_user.comments.new(comment_params)
    @comment_new.book_id = @book.id
    @comments = @book.comments
    if @comment_new.save
    else
      @book_new = Book.new 
    end
  end

  def destroy
    @comment = current_user.comments.find_by(book_id: params[:book_id])
    @comment.destroy
    @comments = Book.find(params[:book_id]).comments
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
