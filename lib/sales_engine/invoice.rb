module SalesEngine
  class Invoice
    attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @customer_id = hash['customer_id'].to_i
      @merchant_id = hash['merchant_id'].to_i
      @status = hash['status']
      @created_at = Date.parse(hash['created_at']) if hash['created_at']
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @invoice_totals = array
    end

    def self.collection
      @invoice_totals
    end

    def self.random
      @invoice_totals.sample
    end

    def self.find_by_id(input)
      @invoice_totals.find {|invoice| invoice.id == input.to_i}
    end

    def self.find_by_customer_id(input)
      @invoice_totals.find {|invoice| invoice.customer_id == input.to_i}
    end

    def self.find_by_merchant_id(input)
      @invoice_totals.find {|invoice| invoice.merchant_id == input.to_i}
    end

    def self.find_by_status(input)
      @invoice_totals.find {|invoice| invoice.status == input.downcase}
    end

    def self.find_all_by_id(input)
      @invoice_totals.find_all {|invoice| invoice.id == input.to_i}
    end

    def self.find_all_by_customer_id(input)
      @invoice_totals.find_all {|invoice| invoice.customer_id == input.to_i}
    end

    def self.find_all_by_merchant_id(input)
      @invoice_totals.find_all {|invoice| invoice.merchant_id == input.to_i}
    end

    def self.find_all_by_status(input)
      @invoice_totals.find_all {|invoice| invoice.status == input.downcase}
    end

    def transactions
      @transactions ||= Transaction.find_all_by_invoice_id(id)
    end

    def invoice_items
      InvoiceItem.find_all_by_invoice_id(id)
    end

    def items
      invoice_items.collect{|invoice_item| invoice_item.item}  
    end

    def customer
      Customer.find_by_id(customer_id)
    end

    def paid?
      transactions.any?{|transaction| transaction.success?}
    end

    def pending?
      !paid?
    end

    def self.new_id
      collection.count + 1
    end

    ### Begin untested section
    def self.create(input)
      new_invoice = Invoice.new({
        'id'=> new_id,
        'customer_id'=>input[:customer].id, 
        'merchant_id'=>input[:merchant].id,
        'status'=>input[:status],
        'created_at'=>Time.now.to_s,
        'updated_at'=>Time.now.to_s
        })
      @invoice_totals << new_invoice

      new_items = input[:items]

      items_count = Hash.new(0)
      new_items.each do |item|
        items_count[item] += 1 
      end

      items_count.each do |item, quantity|
        InvoiceItem.create(
          'invoice_id' => new_invoice.id,
          'item_id' => item.id,
          'unit_price' => item.unit_price,
          'quantity' => quantity
          )
      end
    end

    def charge(input)
      Transaction.create(
        'credit_card_number' => input[:credit_card_number],
        'credit_card_expiration' => input[:credit_card_expiration],
        'result' => input[:result],
        'invoice_id' => id
        )
    end

    ###End untested section
  end
end