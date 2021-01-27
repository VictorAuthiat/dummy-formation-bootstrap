# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %w[
        first_name last_name email password password_confirmation habitat_type
        birthdate birthplace nationality iban patrimony salary habitat_status
        employment_contract bank_identity_statement last_three_pay_slips address
        matrimonial_situation proof_of_identity proof_of_residence contract_type
      ]
    )
  end
end
