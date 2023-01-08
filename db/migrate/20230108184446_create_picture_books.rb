class CreatePictureBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :picture_books do |t|
      t.string :breed, null: false, default: '名無し'
      t.integer :price
      t.string :shop, null: false, default: '不明'
      t.string :picture
      t.timestamps
      t.references :user, foreign_key: true, null:false
    end
  end
end
