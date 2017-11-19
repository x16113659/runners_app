json.extract! item, :id, :category_id, :name, :manufacturer, :price, :colour, :size, :discount, :description, :picture, :popularity, :stock, :hold, :created_at, :updated_at
json.url item_url(item, format: :json)
