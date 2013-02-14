class Item
  attr_reader :first_name

  def initialize(hash)
    @id = hash['id']
    @price = hash['price']
    @description = description['description']
    @item_name = item_name['item_name']
    @merchant_id = merchant_id['merchant_id']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store_array(array)
    @item_totals = array
  end

  def self.find_associated_invoice(input)
    # invoices_found = @item_totals.find_associated_invoice {|invoice| invoice.item_invoice_id == input}
    return invoices_found
  end
end