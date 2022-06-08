class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def create
    post = params[:post]
    user = current_user

    new_post = Post.new(post.permit(:title, :text))
    new_post.user = user

    if new_post.save
      redirect_to user_post_url(user, new_post)
    else
      @post = new_post
      render :new
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end
end
