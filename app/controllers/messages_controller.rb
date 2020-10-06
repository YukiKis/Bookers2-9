class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :setup

  def setup
    @user = User.find(params[:user_id])
    @m1 = current_user.messages.where(followed: @user)
    @m2 = @user.messages.where(followed: current_user)
  end

  def index
    if current_user.following?(@user) && @user.following?(current_user)
    else
      redirect_to @user, notice: "You are not following or sadly you are not followed"
    end
    @messages = (@m1 + @m2).sort
  end

  def create
    if current_user.following?(@user) && @user.following?(current_user)
      current_user.messages.create!(followed: @user, message: message_params[:message])
    end
    @messages = (@m1 + @m2).sort
  end

  def destroy
    @message = Message.find(params[:id])
    if current_user == @message.follower
      @message.destroy
    end
    @messages = (@m1 + @m2).sort
  end

  private
    def message_params
      params.require(:message).permit(:message)
    end
end
