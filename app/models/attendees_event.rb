class AttendeesEvent < ApplicationRecord
  validates_uniqueness_of :attendee_id, scope: :event_id
  belongs_to :attendee, class_name: 'User'
  belongs_to :event, class_name: 'Event'
end
