class Event < ActiveRecord::Base
  validates :name, :start_time, presence: true
  belongs_to :user
  has_many :subsciption


end
