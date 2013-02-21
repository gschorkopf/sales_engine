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
      @merchant_totals.find do |merchant|
        merchant.name.downcase == input.downcase
      end
    end

    def self.find_all_by_name(input)
      @merchant_totals.find_all do |merchant|
        merchant.name.downcase == input.downcase
      end
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
      ii_amt_hash = Hash.new(0)
      InvoiceItem.paid_ii.each do |invoice_item|
        amount = invoice_item.quantity
        ii_amt_hash[invoice_item.invoice_id] += amount
      end

      merchant_quantity_hash = Hash.new(0)
      ii_amt_hash.each_pair do |inv_id, amount|
        merchant = Merchant.find_by_invoice_id(inv_id)
        merchant_quantity_hash[merchant.id] += amount
      end
      sort_items(merchant_quantity_hash, number)
    end

    def self.sort_items(hash, num)
      output_list = []
      sorted_array = Hash[hash.sort_by {|k, v| v}.reverse]
      sorted_array.keys[0,num].each do |merch_id|
        output_list << Merchant.find_by_id(merch_id)
      end
      return output_list
    end

    def revenue(date = :all)
      if date == :all
        Merchant.merchant_revenue_hash[id]
      else
        total_revenue = 0
        InvoiceItem.price_hash.each_pair do |inv_id, revenue|
          create_date = Invoice.find_by_id(inv_id).created_at
          merch_id = Invoice.find_by_id(inv_id).merchant_id
          if create_date == date && merch_id == id
            total_revenue += revenue
          end
        end
        total_revenue
      end
    end

    def self.revenue(date)
      creation_date_revenue_hash = Hash.new(0)
      InvoiceItem.price_hash.each_pair do |inv_id, revenue|
        creat_date = Invoice.find_by_id(inv_id).created_at
        creation_date_revenue_hash[creat_date] += revenue
      end

      creation_date_revenue_hash[date]
    end

    def favorite_customer
      inv_ids = Transaction.all_successful.collect do |successful_transaction|
        successful_transaction.invoice_id
      end
      convert_to_cust_ids(inv_ids)
    end

    def convert_to_cust_ids(array)
      cust_array = []
      array.each do |inv_id|
        if Invoice.find_by_id(inv_id).merchant_id == id
          cust_array << Invoice.find_by_id(inv_id).customer_id
        end
      end
      output_favorite_customer(cust_array)
    end

    def output_favorite_customer(array)
      cust_id_top_hash = Hash.new(0)
      array.each do |cust_id|
        cust_id_top_hash[Customer.find_by_id(cust_id)] += 1
      end
      cust_id_top_hash.sort_by {|customer, trans| trans}.reverse.first.first
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