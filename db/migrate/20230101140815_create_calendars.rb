class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.integer :date_type, nul: false, default: 0
      t.date :record_date, nul: false
      t.timestamps
      t.references :user, foreign_key: true, null:false
    end
  end
end
