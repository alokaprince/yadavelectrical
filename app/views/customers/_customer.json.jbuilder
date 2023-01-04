json.extract! customer, :id, :name, :father, :address, :mobile, :total, :recieve, :balance, :created_at, :updated_at
json.url customer_url(customer, format: :json)
