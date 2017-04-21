class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to user
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to user
  end
  
  def index
    if logged_in?
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page])
    end
  end
end
