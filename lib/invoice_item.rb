class InvoiceItem
  attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @item_id = hash['item_id'].to_i
    @invoice_id = hash['invoice_id'].to_i
    @quantity = hash['quantity'].to_i
    @unit_price = hash['unit_price'].to_i
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @ii_totals = array
  end

end