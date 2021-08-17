class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
  has_many :attendees_events, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendees_events, source: :event, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
