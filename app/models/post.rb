class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, :views_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_post_counter

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
