class CreateSessionBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :session_bookings do |t|
      t.integer :event_session_id
      t.integer :host_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
