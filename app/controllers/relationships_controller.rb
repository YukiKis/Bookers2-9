class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(params[:followed_id])
    rel = current_user.active_relationships.new(followed_id: params[:followed_id])
    rel.save
    redirect_to user
  end

  def destroy
    user = User.find(params[:followed_id])
    current_user.active_relationships.find_by(followed_id: params[:followed_id]).destroy
    redirect_to request.referer
  end
end
