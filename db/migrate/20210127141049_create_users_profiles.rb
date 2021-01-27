class CreateUsersProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :users_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.text :birthplace
      t.string :nationality
      t.string :iban
      t.string :address
      t.string :city
      t.string :zip_code
      t.float :salary
      t.float :patrimony
      t.string :contract_type
      t.string :matrimonial_situation
      t.string :habitat_type
      t.string :habitat_status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
