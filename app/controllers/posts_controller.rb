class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.author_id = current_user.id
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'Post successfully created!'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Error: Error occurred when creating post'
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by!(id: params[:id], user_id: params[:user_id])
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
