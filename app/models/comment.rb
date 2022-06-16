class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_counter

  def as_json(_)
    super(except: %i[updated_at created_at])
  end

  def update_counter
    post.update(
      comments_counter: post.comments.count
    )
  end
end
