class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @customer_id = hash['customer_id'].to_i
    @merchant_id = hash['merchant_id'].to_i
    @status = hash['status']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @invoice_totals = array
  end

  def self.random
    @invoice_totals.sample
  end

  def self.find_by_id(input)
    @invoice_totals.find {|invoice| invoice.id == input.to_i}
  end

  def self.find_by_customer_id(input)
    @invoice_totals.find {|invoice| invoice.customer_id == input.to_i}
  end

  def self.find_by_merchant_id(input)
    @invoice_totals.find {|invoice| invoice.merchant_id == input.to_i}
  end

  def self.find_by_status(input)
    @invoice_totals.find {|invoice| invoice.status == input.downcase}
  end

  def self.find_all_by_id(input)
    @invoice_totals.find_all {|invoice| invoice.id == input.to_i}
  end

  def self.find_all_by_customer_id(input)
    @invoice_totals.find_all {|invoice| invoice.customer_id == input.to_i}
  end

  def self.find_all_by_merchant_id(input)
    @invoice_totals.find_all {|invoice| invoice.merchant_id == input.to_i}
  end

  def self.find_all_by_status(input)
    @invoice_totals.find_all {|invoice| invoice.status == input.downcase}
  end

  def transactions
    # Need to see how Transactions Class looks
  end

  def invoice_items
    #
  end

end