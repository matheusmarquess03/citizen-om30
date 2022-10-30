json.extract! citizen, :id, :full_name, :cpf, :email, :birthdate, :phone, :status, :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
