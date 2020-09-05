json.extract! deck, :id, :title, :category, :user_id, :cardcount, :created_at, :updated_at
json.url deck_url(deck, format: :json)
