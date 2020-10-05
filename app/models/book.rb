class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    Favorite.where(user_id: user.id, book_id: self.id).exists?
  end
end
