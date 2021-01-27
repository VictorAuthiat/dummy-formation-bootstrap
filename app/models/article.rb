class Article < ApplicationRecord
  include ImageUploader::Attachment.new(:picture)

  belongs_to :user

  validates :title, :label, :published_at, presence: true

  scope :published, -> { where('published_at <=?', Time.current) }
end
