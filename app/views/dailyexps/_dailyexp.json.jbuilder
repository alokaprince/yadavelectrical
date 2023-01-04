json.extract! dailyexp, :id, :name, :remark, :amount, :created_at, :updated_at
json.url dailyexp_url(dailyexp, format: :json)
