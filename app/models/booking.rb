
class Booking < ActiveRecord::Base
    belongs_to :user, foreign_key: "user_id"
    #Ensures idnumber field and phone field cannot be blank
    validates :idnumber, length: {minimum: 6}
    validates :phone, presence: true
    validates :lastname, presence:true
end



