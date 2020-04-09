class CreateEventSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :event_sessions do |t|
      t.string :name
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :status
      t.integer :event_id
      t.timestamps
    end
  end
end
