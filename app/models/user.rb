class User < ActiveRecord::Base
    #dependent destroy ensures once user is deleted from database then any bookings are also deleted
    has_many :bookings, dependent: :destroy
    has_secure_password
    validates :idnumber, length: {minimum: 6}
    validates :name, presence:true
    validates :email, presence:true
end
