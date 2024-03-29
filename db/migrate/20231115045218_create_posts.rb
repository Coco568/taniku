class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :content, nul: false
      t.string :image
      t.timestamps
      t.references :user, foreign_key: true, null:false
    end
  end
end
