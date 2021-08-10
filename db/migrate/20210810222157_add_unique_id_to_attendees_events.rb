class AddUniqueIdToAttendeesEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :attendees_events, [:attendee_id, :event_id], unique: true
  end
end
