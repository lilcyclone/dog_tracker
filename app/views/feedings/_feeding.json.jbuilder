json.extract! feeding, :id, :dog_id, :amount, :food_name, :created_at,
              :updated_at
json.url feeding_url(feeding, format: :json)
