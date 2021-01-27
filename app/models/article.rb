class Article < ApplicationRecord
  include ImageUploader::Attachment.new(:picture)

  belongs_to :user

  validates :title, :label, :published_at, presence: true
end
