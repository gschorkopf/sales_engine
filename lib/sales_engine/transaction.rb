module SalesEngine
  class Transaction
    attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

    def initialize(hash)
      @id = hash['id'].to_i
      @invoice_id = hash['invoice_id'].to_i
      @credit_card_number = hash['credit_card_number'].to_i
      @credit_card_expiration_date = hash['credit_card_expiration_date']
      @result = hash['result']
      @created_at = hash['created_at']
      @updated_at = hash['updated_at']
    end

    def self.store(array)
      @transaction_totals = array
    end

    def self.collection
      @transaction_totals
    end

    def self.random
      @transaction_totals.sample
    end

    def self.find_by_id(input)
      @transaction_totals.find {|transaction| transaction.id == input.to_i}
    end

    def self.find_by_invoice_id(input)
      @transaction_totals.find {|transaction| transaction.invoice_id == input.to_i}
    end

    def self.find_all_by_invoice_id(input)
      @transaction_totals.find_all {|transaction| transaction.invoice_id == input.to_i}
    end

    def self.find_by_credit_card_number(input)
      @transaction_totals.find {|transaction| transaction.credit_card_number == input.to_i}
    end

    def invoice
      Invoice.find_by_id(invoice_id)  
    end

    def success?
      result == 'success'
    end

    def self.all_successful
      success_array = []
      @transaction_totals.each do |transaction| 
        if transaction.success? == true
          success_array << transaction
        end
      end
      success_array
    end

    ### OR we need to use this anyway for the rspec
    def self.find_all_by_result(input)
      @transaction_totals.find_all {|transaction| transaction.result == input.downcase}
    end

  end
end