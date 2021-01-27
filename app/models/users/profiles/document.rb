module Users
  module Profiles
    class Document < ApplicationRecord
      extend Enumerize

      belongs_to :profile,
                 inverse_of: :documents,
                 class_name: 'Users::Profile',
                 foreign_key: 'users_profile_id'

      include FileUploader::Attachment(:file)

      validates :name, :file, presence: true

      DOCUMENT_TYPES = %i[
        proof_of_identity
        proof_of_residence
        employment_contract
        last_three_pay_slips
        bank_identity_statement
      ].freeze

      enumerize :name, in: DOCUMENT_TYPES
    end
  end
end
