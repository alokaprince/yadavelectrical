json.extract! bill, :id, :billno, :date, :credit, :debit, :remark, :customer_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
