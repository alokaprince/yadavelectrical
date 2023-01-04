json.extract! dealerbill, :id, :billno, :date, :credit, :debit, :remark, :dealer_id, :created_at, :updated_at
json.url dealerbill_url(dealerbill, format: :json)
