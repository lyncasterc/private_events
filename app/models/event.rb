class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Date.today) } 
  scope :upcoming, -> { where("date >= ?", Date.today) }
  
  belongs_to :creator, class_name: 'User'
  has_many :attendees_events, dependent: :destroy
  has_many :attendees, through: :attendees_events, dependent: :destroy
  has_one_attached :image

  validates :title, :description, :date, :time, :location, :image, presence: true


end