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

  def self.most_items(number_of_merchants)

    invoice_items.inject(Hash.new(0)) do |total_items, invoice_item|

      item = Item.find_by_id(invoice_item.item_id)

      merchant = Merchant.find_by_id(item.merchant_id)

      total_items[merchant] = total_items[merchant] + invoice_item.quantity
      total_items
    end
    ... [0..number_of_merchants]

  end

end