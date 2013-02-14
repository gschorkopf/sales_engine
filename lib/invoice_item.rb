class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @item_id = hash['item_id']
    @invoice_id = hash['invoice_id']
    @quantity = hash['quantity']
    @unit_price = hash['unit_price']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store_array(array)
    @invoice_item_totals = array
  end

  def self.find_all_by_quantity(input)
    quan_found = @invoice_item_totals.find_all {|invoice_item| invoice_item.quantity == input}
    return quan_found
  end
end