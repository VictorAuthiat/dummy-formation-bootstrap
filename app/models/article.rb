class Article < ApplicationRecord
  belongs_to :user

  validates :title, :label, :published_at, presence: true
end
