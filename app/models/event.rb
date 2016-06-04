class Event < ActiveRecord::Base
  validates :name, :start_time, presence: true
  has_many :subscriptions
  has_many :users, through: :subscriptions

end
