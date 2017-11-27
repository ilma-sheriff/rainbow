json.array!(@schools) do |school|
  json.extract! school, :name, :address
  json.url clock_url(school, format: :json)
end
