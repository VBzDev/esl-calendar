json.extract! booking, :id, :name, :subject, :start_time, :end_time, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
