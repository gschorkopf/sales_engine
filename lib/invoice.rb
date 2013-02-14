class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @customer_id = hash['customer_id']
    @merchant_id = hash['merchant_id']
    @status = hash['status']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store_array(array)
    @invoice_totals = array
  end

  def self.find_all_by_customer_id(input)
    customer_ids_found = @invoice_totals.find_all {|invoice| invoice.customer_id == input}
    return customer_ids_found
  end

end