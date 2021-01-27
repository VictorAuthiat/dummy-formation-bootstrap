# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        profile_attributes: [
          :id, :first_name, :last_name, :birthdate, :birthplace, :iban,
          :patrimony, :salary, :habitat_status, :address, :nationality,
          :matrimonial_situation, :contract_type, { documents_attributes: %i[name file] }
        ]
      ]
    )
  end
end
