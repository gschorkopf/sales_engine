class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @name = hash['name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @merchant_totals = array
  end

  def self.random
    @merchant_totals.sample
  end

  def self.find_by_id(input)
    @merchant_totals.find {|merchant| merchant.id == input.to_i}
  end

  def self.find_all_by_id(input)
    @merchant_totals.find_all {|merchant| merchant.id == input.to_i}
  end

  def self.find_all_by_ids(array_of_ids)
    array_of_ids.collect {|merchant_id| Merchant.find_by_id(merchant_id)}
  end

  def self.find_by_invoice_id(inv_id)
    invoice_object = Invoice.find_by_id(inv_id)
    Merchant.find_by_id(invoice_object.merchant_id)
  end

  def self.find_by_name(input) 
    @merchant_totals.find {|merchant| merchant.name.downcase == input.downcase}
  end

  def self.find_all_by_name(input)
    @merchant_totals.find_all {|merchant| merchant.name.downcase == input.downcase}
  end

  def items
    Item.find_all_by_merchant_id(id)
  end

  def invoices
    Invoice.find_all_by_merchant_id(id)
  end

  def self.merchant_revenue_hash
    hash = Hash.new(0)
    InvoiceItem.price_hash.each_pair do |inv_id, revenue|
      merchant = Merchant.find_by_invoice_id(inv_id)
      hash[merchant.id] += revenue
    end
    hash
  end

  def self.merchants_sorted_highest_to_lowest_revenue
    merchant_revenue_hash.sort_by {|merchant_id, revenue| revenue}.reverse
  end

  def self.most_revenue(number)
    sorted_array = Hash[merchants_sorted_highest_to_lowest_revenue]
    merchant_ids = sorted_array.keys[0,number]
    Merchant.find_all_by_ids(merchant_ids)
  end

  def self.most_items(number)
    invoice_item_amount_hash = Hash.new(0)
    $invoice_items.each do |invoice_item|
      amount = invoice_item.quantity
      invoice_item_amount_hash[invoice_item.invoice_id] += amount
    end

    merchant_quantity_hash = Hash.new(0)
    invoice_item_amount_hash.each_pair do |inv_id, amount|
      merchant = Merchant.find_by_invoice_id(inv_id)
      merchant_quantity_hash[merchant.id] += amount 
    end

    output_list = []
    sorted_array = Hash[merchant_quantity_hash.sort_by {|merchant_id, amount| amount}.reverse]
    sorted_array.keys[0..number-1].each {|merchant_id| output_list << Merchant.find_by_id(merchant_id)}

    return output_list 
  end

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

end


















