class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter
    self.user.update(posts_counter: self.user.posts.count)
  end

  def recent_five_comments
    self.comments.last(5)
  end
end
