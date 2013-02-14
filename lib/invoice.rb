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

  def self.find_all_by_customer_id(input)
    @invoice_totals.find_all {|invoice| invoice.customer_id == input.to_i}
  end

end