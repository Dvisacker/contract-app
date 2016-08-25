json.extract! comment, :id, :title, :body, :user_id, :replies, :timestamp, :created_at, :updated_at
json.url comment_url(comment, format: :json)