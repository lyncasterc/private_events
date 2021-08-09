class AttendeesEvent < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event, class_name: 'Event'
end
