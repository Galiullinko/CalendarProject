class Event < ActiveRecord::Base
  validates :name, :start_time, presence: true



end
