class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :reply_to, index: true # , foreign_key: true
      t.references :topic, index: true # , foreign_key: true
      t.string :state

      t.timestamps null: false
    end
  end
end
