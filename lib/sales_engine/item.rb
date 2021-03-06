module SalesEngine
  class Item
    attr_reader :id, :name, :description, :unit_price,
                :merchant_id, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @name = hash['name']
      @description = hash['description']
      @unit_price = Clean.price(hash['unit_price'])
      @merchant_id = hash['merchant_id'].to_i
      @created_at = hash['created_at']
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @item_totals = array
    end

    def self.collection
      @item_totals
    end

    def self.random
      @item_totals.sample
    end

    def self.find_by_id(input)
      @item_totals.find {|item| item.id == input.to_i}
    end

    def self.find_all_by_id(input)
      @item_totals.find_all {|item| item.id == input.to_i}
    end

    def self.find_by_name(input)
      @item_totals.find {|item| item.name.downcase == input.downcase}
    end

    def self.find_all_by_name(input)
      @item_totals.find_all {|item| item.name.downcase == input.downcase}
    end

    def self.find_by_description(input)
      @item_totals.find {|item| item.description.downcase == input.downcase}
    end

    def self.find_all_by_description(input)
      @item_totals.find_all{|item| item.description.downcase == input.downcase}
    end

    def self.find_by_unit_price(input)
      @item_totals.find {|item| item.unit_price == input}
    end

    def self.find_all_by_unit_price(input)
      @item_totals.find_all {|item| item.unit_price == input}
    end

    def self.find_by_merchant_id(input)
      @item_totals.find {|item| item.merchant_id == input.to_i}
    end

    def self.find_all_by_merchant_id(input)
      @item_totals.find_all {|item| item.merchant_id == input.to_i}
    end

    def merchant
      Merchant.find_by_id(merchant_id)
    end

    def invoice_items
      InvoiceItem.find_all_by_item_id(id)
    end

    def self.most_revenue(number)
      item_id_revenue_hash = Hash.new(0)
      InvoiceItem.collection.each do |invoice_item|
        amount = invoice_item.quantity
        price = invoice_item.unit_price
        revenue_generated = amount * price
        item_id_revenue_hash[invoice_item.item_id] += revenue_generated
      end
      sort_item_hash(item_id_revenue_hash, number)
    end

    def self.most_items(number)
      invoice_item_amount_hash = Hash.new(0)
      InvoiceItem.paid_ii.each do |invoice_item|
        amount = invoice_item.quantity
        invoice_item_amount_hash[invoice_item.item_id] += amount
      end
      sort_item_hash(invoice_item_amount_hash, number)
    end

    def self.sort_item_hash(hash, num)
      output_list = []
      sorted_array = Hash[hash.sort_by {|k, v| v}.reverse]
      sorted_array.keys[0,num].each do |k|
        output_list << Item.find_by_id(k)
      end
      return output_list
    end

    def best_day
      ii_by_id = InvoiceItem.find_all_by_item_id(id)
      ii_hash = Hash.new(0)
      ii_by_id.each do |ii|
        ii_hash[ii.invoice_id] += ii.quantity
      end
      order_day(ii_hash)
    end

    def order_day(hash)
      output_list = []
      sorted_array = Hash[hash.sort_by {|k, v| v}.reverse]
      sorted_array.keys.each do |inv_id|
        output_list << Invoice.find_by_id(inv_id).created_at
      end
      return output_list.first
    end

  end
end







