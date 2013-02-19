# returns the total revenue for that merchant across all transactions
# some-merchant.revenue
  def revenue
    invoice_item_revenue_hash = Hash.new(0)
    $invoice_items.each do |invoice_item| 
      revenue = invoice_item.unit_price * invoice_item.quantity
      invoice_item_revenue_hash[invoice_item.invoice_id] += revenue
    end

    merchant_revenue_hash = Hash.new(0)
    invoice_item_revenue_hash.each_pair do |inv_id, revenue|
      invoice_object = Invoice.find_by_id(inv_id)
      merchant_object = Merchant.find_by_id(invoice_object.merchant_id)
      merchant_revenue_hash[merchant_object.id] += revenue
    end

    # need to return merchant's total revenue
  end

# returns the Customer who has conducted the most successful transactions
  def favorite_customer
    successful_transactions_hash = Hash.new(0)
    transactions.each do |transactions|
      successful_trans = # transactions.result == 'success'
      successful_transactions_hash[transactions.invoice_id] += successful_trans
    end

    best_customer_hash = Hash.new(0)
    successful_transactions_hash.each_pair do |trans_id, success|
      transaction_object  = Transaction.find_by_id(trans_id)
      customer_object = Customer.find_by_id(transaction_object.result)
      # best_customer_hash[customer_object.id] += successful_trans
    end

    # need to return customer info
  end

# returns the total revenue for that merchant for a specific invoice date
  def revenue(date)

    invoice_date_revenue_hash = Hash.new(0)
    invoice.each do |invoice_date| 
      invoice_date = invoice_item.created_at # not sure if this is necessary but we need to call dates from "created_at" column
      revenue = invoice_item.unit_price * invoice_item.quantity
      invoice_date_revenue_hash[invoice_item.invoice_date] += revenue
    end

    merchant_date_revenue_hash = Hash.new(0)
    invoice_date_revenue_hash.each_pair do |inv_id, revenue|
      invoice_object = Invoice.find_by_id(inv_id)
      merchant_object = Merchant.find_by_id(invoice_object.merchant_id)
      merchant_date_revenue_hash[merchant_object.id] += revenue
    end

    # need to return a merchant's total revenue
    # not sure where to include .strptime for parsing date info
  end




