class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend Enumerize

  include FileUploader::Attachment.new(:proof_of_identity)
  include FileUploader::Attachment.new(:proof_of_residence)
  include FileUploader::Attachment.new(:employment_contract)
  include FileUploader::Attachment.new(:last_three_pay_slips)
  include FileUploader::Attachment.new(:bank_identity_statement)

  MATRIMONIAL_SITUATIONS = %i[
    common_law
    divorced
    widowed
    single
    maried
    pacs
  ].freeze

  HABITAT_STATUS = %i[owner tenant hosted_for_free].freeze
  HABITAT_TYPES = %i[house flat].freeze

  has_many :articles, dependent: :destroy

  enumerize(:matrimonial_situation, in: MATRIMONIAL_SITUATIONS)
  enumerize(:habitat_status, in: HABITAT_STATUS)
  enumerize(:habitat_type, in: HABITAT_TYPES)

  validates :email, :first_name, :last_name, :birthdate, presence: true
end
