class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post_id: params[:post_id])
    @like.user_id = @user.id
    @like.post_id = params[:post_id]
    redirect_to user_post_path(@user, @post) if @like.save
  end
end
