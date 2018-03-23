json.extract! employee, :id, :idnumber, :firstname, :lastname, :created_at, :updated_at
json.url employee_url(employee, format: :json)
