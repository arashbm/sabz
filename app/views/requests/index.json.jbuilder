json.array!(@requests) do |request|
  json.extract! request, :name, :sku, :manufacturer, :quantity, :discription, :url
  json.url request_url(request, format: :json)
end
