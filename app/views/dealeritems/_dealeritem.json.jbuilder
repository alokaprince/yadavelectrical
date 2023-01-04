json.extract! dealeritem, :id, :itemname, :quantity, :rate, :unit, :amount, :dealerbill_id, :created_at, :updated_at
json.url dealeritem_url(dealeritem, format: :json)
