class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend Enumerize

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

  enumerize(:matrimonial_situation, in: MATRIMONIAL_SITUATIONS)
  enumerize(:habitat_status, in: HABITAT_STATUS)
  enumerize(:habitat_type, in: HABITAT_TYPES)

  validates :email, :first_name, :last_name, :birthdate, presence: true
end
