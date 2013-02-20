module SalesEngine
  class Customer
    attr_reader :id, :first_name, :last_name, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @first_name = hash['first_name']
      @last_name = hash['last_name']
      @created_at = hash['created_at']
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @customers = array
    end

    def self.collection
      @customers
    end

    def self.random
      @customers.sample
    end

    def self.find_by_id(input)
      @customers.find {|customer| customer.id == input.to_i}
    end

     def self.find_by_first_name(input)
      @customers.find do |customer|
        customer.first_name.downcase == input.downcase
      end
    end

    def self.find_by_last_name(input)
      @customers.find {|customer| customer.last_name.downcase == input.downcase}
    end

    def self.find_all_by_id(input)
      @customers.find_all {|customer| customer.id == input.to_i}
    end

    def self.find_all_by_first_name(input)
      @customers.find_all do |customer|
        customer.first_name.downcase == input.downcase
      end
    end

    def self.find_all_by_last_name(input)
      @customers.find_all do |customer|
        customer.last_name.downcase == input.downcase
      end
    end

    def invoices
      Invoice.find_all_by_customer_id(id)
    end

    def transactions
      invoices.collect do |invoice|
        Transaction.find_by_invoice_id(invoice.id)
      end.uniq
    end

    def favorite_merchant
      inv_ids = Transaction.all_successful.collect do |successful_transaction|
        successful_transaction.invoice_id
      end

      merch_array = []
      inv_ids.each do |inv_id|
        if Invoice.find_by_id(inv_id).customer_id == id
          merch_array << Invoice.find_by_id(inv_id).merchant_id
        end
      end

      merch_id_top_hash = Hash.new(0)
      merch_array.each do |merch_id|
        merch_id_top_hash[Merchant.find_by_id(merch_id)] += 1
      end

      merch_id_top_hash.sort_by {|merchant, trans| trans}.reverse.first.first
    end

  end
end