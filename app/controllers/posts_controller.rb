class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(user_id: @user)
  end

  def show
    @user = User.find_by(id: params[:user_id])
   # @post = Post.find_by!(id: params[:id], user_id: params[:user_id])
     @post = Post.find(params[:id])
    
  end
end
