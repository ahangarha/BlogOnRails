class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }

  after_save :update_posts_counter

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_five_comments
    comments.last(5)
  end
end
