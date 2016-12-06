class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  has_many :comments
  def self.search(keyword)
    Article.where('title like ?', "%#{keyword}")
  end
end
