class CommentsController < ApplicationController
  def create
    comment_author = current_user
    post = Post.find(params[:post_id])
    post_author = post.user

    comment = params[:comment]

    new_comment = Comment.new(comment.permit(:text))
    new_comment.post = post
    new_comment.user = comment_author

    redirect_to user_post_url(post_author, post) if new_comment.save
  end
end