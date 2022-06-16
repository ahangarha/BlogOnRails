class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  def as_json(_)
    super(only: %i[id name bio photo posts_counter])
  end

  def recent_3_posts
    posts.includes(:user).order(created_at: :DESC).limit(3)
  end
end
