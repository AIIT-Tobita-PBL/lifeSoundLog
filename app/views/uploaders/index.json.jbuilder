json.array!(@uploaders) do |uploader|
  json.extract! uploader, :id, :filename, :filepath, :user_id
  json.url uploader_url(uploader, format: :json)
end
