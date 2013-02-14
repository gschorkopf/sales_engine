class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @item_id = hash['item_id'].to_i
    @invoice_id = hash['invoice_id'].to_i
    @quantity = hash['quantity'].to_i
    @unit_price = hash['unit_price'] # how will this work?
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @invoice_item_totals = array
  end

  def self.find_all_by_quantity(input)
    @invoice_item_totals.find_all {|invoice_item| invoice_item.quantity == input.to_i}
  end
end