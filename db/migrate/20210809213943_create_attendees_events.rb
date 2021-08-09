class CreateAttendeesEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees_events do |t|
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
