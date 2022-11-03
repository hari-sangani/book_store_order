json.extract! user, :id, :name, :email, :contact_no, :address, :username, :active, :created_at, :updated_at
json.url user_url(user, format: :json)
