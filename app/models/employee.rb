class Employee < ActiveRecord::Base
    has_many    :bookings
    #Ensures lastname field cannot be blank
    validates :lastname, presence: true
    validates :idnumber, length: {minimum: 6}
end

