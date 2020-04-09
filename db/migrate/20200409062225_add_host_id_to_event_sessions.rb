class AddHostIdToEventSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :event_sessions, :host_id, :integer
  end
end
