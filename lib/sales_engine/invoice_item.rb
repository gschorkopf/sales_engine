module SalesEngine
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

    def self.collection
      @ii_totals
    end

    def self.find_all_by_invoice_id(input)
      @ii_totals.find_all {|ii| ii.invoice_id == input.to_i}
    end

    def self.find_all_by_item_id(input)
      @ii_totals.find_all {|ii| ii.item_id == input}
    end

    def self.price_hash
      hash = Hash.new(0)
      InvoiceItem.collection.each do |invoice_item| 
        revenue = invoice_item.unit_price * invoice_item.quantity
        hash[invoice_item.invoice_id] += revenue
      end
      hash
    end

    def invoice
      Invoice.find_by_id(invoice_id)
    end

    def item
      Item.find_by_id(item_id)
    end

  end
end