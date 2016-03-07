json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :password, :postal_adress
  json.url user_url(user, format: :json)
end
