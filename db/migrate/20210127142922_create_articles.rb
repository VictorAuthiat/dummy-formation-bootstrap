class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :picture_data
      t.date :published_at
      t.string :label

      t.timestamps
    end
  end
end
