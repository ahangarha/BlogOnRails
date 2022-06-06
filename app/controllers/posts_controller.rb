class PostsController < ApplicationController
  def index
    @posts = Post.where(user: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
