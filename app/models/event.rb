class Event < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
  
end
