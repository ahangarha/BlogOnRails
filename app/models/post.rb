class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  after_save :update_posts_counter

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def recent_five_comments
    comments.includes(:user).order(created_at: :desc).limit(5)
  end
end
