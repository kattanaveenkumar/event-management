class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :venue_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.float :entry_fee
      t.float :status
      t.integer :user_id
      t.integer :tickets_left

      t.timestamps
    end
  end
end
