module Users
  class Profile < ApplicationRecord
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

    belongs_to :user, inverse_of: :profile

    has_many :documents,
             dependent: :destroy,
             inverse_of: :profile,
             foreign_key: 'users_profile_id',
             class_name: 'Users::Profiles::Document'

    accepts_nested_attributes_for :documents

    enumerize :matrimonial_situation, in: MATRIMONIAL_SITUATIONS
    enumerize :habitat_status, in: HABITAT_STATUS
    enumerize :habitat_type, in: HABITAT_TYPES

    validates :first_name, :last_name, :birthdate, presence: true
  end
end
