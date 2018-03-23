json.extract! booking, :id, :idnumber, :firstname, :lastname, :phone, :bookingfor, :socialclubname, :socialclublocation, :created_at, :updated_at
json.url booking_url(booking, format: :json)
