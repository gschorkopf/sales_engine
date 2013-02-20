class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @customer_totals = array
  end

  def self.collection
    @customer_totals
  end

  def self.random
    @customer_totals.sample
  end

  def self.find_by_id(input)
    @customer_totals.find {|customer| customer.id == input.to_i}
  end

   def self.find_by_first_name(input)
    @customer_totals.find {|customer| customer.first_name.downcase == input.downcase}
  end

  def self.find_by_last_name(input)
    @customer_totals.find {|customer| customer.last_name.downcase == input.downcase}
  end

  def self.find_all_by_id(input)
    @customer_totals.find_all {|customer| customer.id == input.to_i}
  end

  def self.find_all_by_first_name(input)
    @customer_totals.find_all {|customer| customer.first_name.downcase == input.downcase}
  end

  def self.find_all_by_last_name(input)
    @customer_totals.find_all {|customer| customer.last_name.downcase == input.downcase}
  end

  def invoices
    Invoice.find_all_by_customer_id(id)
  end

  def transactions
    invoices.collect do |invoice|
      Transaction.find_by_invoice_id(invoice.id)
    end.uniq
  end

  def favorite_merchant
    # invoice_list = Invoice.find_all_by_customer_id(id)

    # success_list = Transaction.all_successful
    # merch_id_list = success_list.collect {|inv_id| Invoice.find_by_id(inv_id).merchant_id}

    # merchant_invoice_hash = Hash.new(0)
    # invoice_list.each do |invoice|
    #   merch_id_list.include? invoice.merchant_id  
    #   merchant_invoice_hash[invoice.merchant_id] += 1
    # end

    # top_merchant = merchant_invoice_hash.sort_by {|k,v| v}.first[0]
    # Merchant.find_by_id(top_merchant)

    # Method definitely not correct. The "Include?" section does not account for doubles
  end

end







