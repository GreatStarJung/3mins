json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :content, :youtube
  json.url blog_url(blog, format: :json)
end
