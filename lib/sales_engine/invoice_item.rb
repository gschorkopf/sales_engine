module SalesEngine
  class InvoiceItem
    attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @item_id = hash['item_id'].to_i
      @invoice_id = hash['invoice_id'].to_i
      @quantity = hash['quantity'].to_i
      @unit_price = Clean.price(hash['unit_price'])
      @created_at = hash['created_at']
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @ii_totals = array
    end

    def self.collection
      @ii_totals
    end

    def self.paid_ii
      @paid_ii = []
      collection.each do |ii|
        if Invoice.find_by_id(ii.invoice_id).paid?
          @paid_ii << ii
        end
      end
      @paid_ii
      #no matching test
    end

    def self.random
      @ii_totals.sample
    end

    def self.find_by_id(input)
      @ii_totals.find {|ii| ii.id == input.to_i}
      #no matching test
    end

    def self.find_all_by_invoice_id(input)
      @ii_totals.find_all {|ii| ii.invoice_id == input.to_i}
    end

    def self.find_by_item_id(input)
      @ii_totals.find {|ii| ii.item_id == input.to_i}
      #no matching test
    end

    def self.find_all_by_item_id(input)
      @ii_totals.find_all {|ii| ii.item_id == input.to_i}
    end

    def self.find_all_by_quantity(input)
      @ii_totals.find_all {|ii| ii.quantity == input.to_i}
      #no matching test
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

    ### Begin untested section
    def self.new_id
      collection.count + 1 #Cheating way?
    end

    def self.create(input)
      new_ii = InvoiceItem.new({"id" => new_id,
                                "item_id" => input[:item_id],
                                "invoice_id" => input[:invoice_id],
                                "quantity" => input[:quantity],
                                "unit_price" => input[:unit_price],
                                "created_at" => Time.now.to_s, 
                                "updated_at" => Time.now.to_s})
      @ii_totals << new_ii
    end
    ### End untested section
  end
end