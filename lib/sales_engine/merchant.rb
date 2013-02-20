module SalesEngine
  class Merchant
    attr_reader :id, :name, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @name = hash['name']
      @created_at = Date.parse(hash['created_at'])
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @merchant_totals = array
    end

    def self.collection
      @merchant_totals
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

    def self.find_all_by_ids(array_of_ids)
      array_of_ids.collect {|merchant_id| Merchant.find_by_id(merchant_id)}
    end

    def self.find_by_invoice_id(inv_id)
      invoice_object = Invoice.find_by_id(inv_id)
      Merchant.find_by_id(invoice_object.merchant_id)
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

    def self.merchant_revenue_hash
      hash = Hash.new(0)
      InvoiceItem.price_hash.each_pair do |inv_id, revenue|
        merchant = Merchant.find_by_invoice_id(inv_id)
        hash[merchant.id] += revenue
      end
      hash
    end

    def self.merchants_sorted_highest_to_lowest_revenue
      merchant_revenue_hash.sort_by {|merchant_id, revenue| revenue}.reverse
    end

    def self.most_revenue(number)
      sorted_array = Hash[merchants_sorted_highest_to_lowest_revenue]
      merchant_ids = sorted_array.keys[0,number]
      Merchant.find_all_by_ids(merchant_ids)
    end

    def self.most_items(number)
      invoice_item_amount_hash = Hash.new(0)
      InvoiceItem.collection.each do |invoice_item|
        amount = invoice_item.quantity
        invoice_item_amount_hash[invoice_item.invoice_id] += amount
      end

      merchant_quantity_hash = Hash.new(0)
      invoice_item_amount_hash.each_pair do |inv_id, amount|
        merchant = Merchant.find_by_invoice_id(inv_id)
        merchant_quantity_hash[merchant.id] += amount 
      end

      output_list = []
      sorted_array = Hash[merchant_quantity_hash.sort_by {|merchant_id, amount| amount}.reverse]
      sorted_array.keys[0..number-1].each {|merchant_id| output_list << Merchant.find_by_id(merchant_id)}

      return output_list 
    end

    def revenue(date = "none given")
      if date == "none given"
        Merchant.merchant_revenue_hash[id]
      else
        # INSERT CODE HERE
      end
    end

    def self.revenue(date)
      creation_date_revenue_hash = Hash.new(0)
      InvoiceItem.price_hash.each_pair do |inv_id, revenue|
        creation_date_revenue_hash[Invoice.find_by_id(inv_id).created_at] += revenue
      end

      creation_date_revenue_hash[Date.parse(date)]
    end

    def favorite_customer
      inv_ids = Transaction.all_successful.collect do |successful_transaction|
        successful_transaction.invoice_id
      end
      
      cust_id_trans_hash = Hash.new(0)
      inv_ids.each do |inv_id|
        cust_id_trans_hash[Invoice.find_by_id(inv_id).customer_id] += 1
      end

      top_customer = cust_id_trans_hash.sort_by {|cust_id, trans| trans}.reverse.first.first
      # REFACTORING WEDNESDAY BLASDHLASIDHSAOHOAS!!!
      Customer.find_by_id(top_customer)
    end

    def customers_with_pending_invoices
      pending_array = []

      Invoice.collection.each do |invoice|
        if invoice.merchant_id == id && invoice.pending?
          pending_array << Customer.find_by_id(invoice.customer_id)
        end
      end
      pending_array
    end

  end
end

















