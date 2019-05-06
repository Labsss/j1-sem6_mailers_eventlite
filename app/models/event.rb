class Event < ApplicationRecord

    belongs_to :user
    has_many :attendances

    validates :start_date, presence: true  #(:start_date_cannot_be_in_the_past)
    validates :duration, presence: true, numericality: true, greater_than: { 0 }
    validate :multiple_de_5
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { in: 1..1000 }
    validates :location, presence: true 

# Ne peut pas démarrer dans le passé
#    def start_date_cannot_be_in_the_past
#        errors.add(:start_date, "can't be in the past") if
#          !start_date.blank? and start_date < Date.today
#        end
#    end

    def multiple_de_5
        if duration % 5 != 0
            error.add(:duration, "Multiple of 5 please !")
        end
    end 
end
