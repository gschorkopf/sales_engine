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

  # def self.most_revenue(number)
  #   #Insert Ruby code HERRR
  # end

  ##Start move to transaction file##
  # def is_successful?
  #   if self.result == 'success'
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def self.all_successful
  #   success_array = []
  #   @transactions.select {|transaction| transaction.is_successful? == true}.collect |transaction| do 
  #     success_array << transaction.invoice_id
  #   end
  #   success_array
  # end
  ##End move to transaction file##

  def self.most_items(number)
    invoice_item_amount_hash = Hash.new(0)
    $invoice_items.each do |invoice_item|
      amount = invoice_item.quantity
      invoice_item_amount_hash[invoice_item.invoice_id] += amount
    end

    merchant_quantity_hash = Hash.new(0)
    invoice_item_amount_hash.each_pair do |inv_id, amount|
      invoice_object = Invoice.find_by_id(inv_id)
      merchant_object = Merchant.find_by_id(invoice_object.merchant_id)
      merchant_quantity_hash[merchant_object.id] += amount 
    end

    output_list = []
    sorted_array = Hash[merchant_quantity_hash.sort_by { |k,v| v }.reverse]
    sorted_array.keys[0..number-1].each {|key| output_list << Merchant.find_by_id(key)}

    return output_list 
  end

end


















