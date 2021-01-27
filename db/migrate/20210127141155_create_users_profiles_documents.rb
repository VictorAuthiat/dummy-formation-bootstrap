class CreateUsersProfilesDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :users_profiles_documents do |t|
      t.string :name
      t.text :file_data
      t.references :users_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
