class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :name,            null: false
      t.integer :gender,         null: false, default: 0
      t.integer :prefecture_code, null:false, default: 0
      t.string :icon       
      t.timestamps                null: false
    end
  end
end
