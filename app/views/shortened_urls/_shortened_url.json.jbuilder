json.extract! shortened_url, :id, :short_url, :long_url, :created_at, :updated_at
json.url shortened_url_url(shortened_url, format: :json)
