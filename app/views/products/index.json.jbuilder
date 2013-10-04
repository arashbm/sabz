json.array!(@products) do |product|
  json.extract! product, :name, :sku, :provider_id, :manufacturer, :quantity, :discription, :url
  json.url product_url(product, format: :json)
end
