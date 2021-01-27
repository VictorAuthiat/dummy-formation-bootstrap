class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :birthplace, :text
    add_column :users, :nationality, :string
    add_column :users, :iban, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :string
    add_column :users, :salary, :float
    add_column :users, :patrimony, :float
    add_column :users, :contract_type, :string
    add_column :users, :matrimonial_situation, :string
    add_column :users, :proof_of_identity_data, :text
    add_column :users, :proof_of_residence_data, :text
    add_column :users, :employment_contract_data, :text
    add_column :users, :last_three_pay_slips_data, :text
    add_column :users, :bank_identity_statement_data, :text
    add_column :users, :habitat_type, :string
    add_column :users, :habitat_status, :string
  end
end
