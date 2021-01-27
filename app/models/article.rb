class Article < ApplicationRecord
  include ImageUploader::Attachment.new(:picture)

  validates :title, :label, :published_at, presence: true

  scope :published, -> { where('published_at <=?', Time.current) }
end
