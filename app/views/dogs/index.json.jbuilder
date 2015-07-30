json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :age, :description, :particular_signals, :owner_name, :owner_email, :owner_phone, :lat, :lng, :breed_id
  json.url dog_url(dog, format: :json)
end
