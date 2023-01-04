json.extract! item, :id, :itemname, :quantity, :rate, :unit, :amount, :bill_id, :created_at, :updated_at
json.url item_url(item, format: :json)
