class Invoice
  attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @customer_id = hash['customer_id'].to_i
    @merchant_id = hash['merchant_id'].to_i
    @status = hash['status']
    @created_at = Date.parse(hash['created_at']) if hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @invoice_totals = array
  end

  def self.collection
    @invoice_totals
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
    @transactions ||= Transaction.find_all_by_invoice_id(id)
  end

  def invoice_items
    InvoiceItem.find_all_by_invoice_id(id)
  end

  def items
    invoice_item_collection = InvoiceItem.find_all_by_invoice_id(id)
    items_collection = invoice_item_collection.collect {|invoice_item| invoice_item.item_id == Item.find_by_id(invoice_item.item_id)}
  end

  def customer
    Customer.find_by_id(customer_id)
  end

  def paid?
    transactions.any?{|transaction| transaction.success?}
  end

  def pending?
    !paid?
  end

  def self.create(input)
    Invoice.new('customer_id'=>input[:customer].id, 
                'merchant_id'=>input[:merchant].id
                )
  end


  ### Create function for final iteration
  # def self.create(inputs)
  #   new_invoice = InvoiceItem.new(
  #               id: #what goes here?
  #               customer_id: input[:customer].id,
  #               merchant_id: input[:merchant].id,
  #               status: input[:status]
  #               created_at: Date.new
  #               updated_at: Date.new
  #               )
  #   @invoice_totals << new_invoice  
  # end

end