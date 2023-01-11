class CreatePictureBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :picture_books do |t|
      t.string :breed, nul: false
      t.string :price
      t.string :shop
      t.date :purchase_date, nul: false, default: Date.current.strftime
      t.string :picture
      t.timestamps
      t.references :user, foreign_key: true, null:false
    end
  end
end
