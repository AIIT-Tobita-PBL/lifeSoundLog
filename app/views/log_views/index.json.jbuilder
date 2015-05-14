json.array!(@log_views) do |log_view|
  json.extract! log_view, :id, :user_id, :msg
  json.url log_view_url(log_view, format: :json)
end
