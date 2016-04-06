json.array!(@comments) do |comment|
  json.extract! comment, :id, :mention, :user_id, :blog_id
  json.url comment_url(comment, format: :json)
end
