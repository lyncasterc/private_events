class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees_events
  has_many :attendees, through: :attendees_events
  has_one_attached :image

  validates :title, :description, :date, :location, presence: true
end