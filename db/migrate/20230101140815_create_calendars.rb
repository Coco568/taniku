class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
