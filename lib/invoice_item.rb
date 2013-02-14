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

  def self.random
    @ii_totals.sample
  end

  def self.find_by_id(input)
    @ii_totals.find {|invoice_item| invoice_item.id == input.to_i}
  end

  def self.find_by_item_id(input)
    @ii_totals.find {|invoice_item| invoice_item.item_id == input.to_i}
  end

  def self.find_by_invoice_id(input)
    @ii_totals.find {|invoice_item| invoice_item.invoice_id == input.to_i}
  end

  def self.find_by_quantity(input)
    @ii_totals.find {|invoice_item| invoice_item.quantity == input.to_i}
  end

  def self.find_by_unit_price(input)
    @ii_totals.find {|invoice_item| invoice_item.unit_price == input.to_i}
  end

  def self.find_all_by_id(input)
    @ii_totals.find_all {|invoice_item| invoice_item.id == input.to_i}
  end

  def self.find_all_by_item_id(input)
    @ii_totals.find_all {|invoice_item| invoice_item.item_id == input.to_i}
  end

  def self.find_all_by_invoice_id(input)
    @ii_totals.find_all {|invoice_item| invoice_item.invoice_id == input.to_i}
  end

  def self.find_all_by_quantity(input)
    @ii_totals.find_all {|invoice_item| invoice_item.quantity == input.to_i}
  end

  def self.find_all_by_unit_price(input)
    @ii_totals.find_all {|invoice_item| invoice_item.unit_price == input.to_i}
  end

end