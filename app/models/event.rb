class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees_events, dependent: :destroy
  has_many :attendees, through: :attendees_events, dependent: :destroy
  has_one_attached :image

  validates :title, :description, :date, :time, :location, presence: true
end