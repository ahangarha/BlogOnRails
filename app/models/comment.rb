class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    self.post.update(
      comments_counter: self.post.comments.count
    )
  end
end
