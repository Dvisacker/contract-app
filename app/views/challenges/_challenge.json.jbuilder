json.extract! challenge, :id, :title, :body, :challenge_id, :time_created, :code, :hint1, :hint2, :user_viewcount, :created_at, :updated_at
json.url challenge_url(challenge, format: :json)