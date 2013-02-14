class Transaction
  attr_reader :first_name

  def initialize(hash)
    @cc_number = hash['cc_number']
    @exp_date = hash['exp_date']
    @trans_date = hash['trans_date']
    @invoice_id = hash['invoice_id']
  end

  def self.store_array(array)
    @transaction_totals = array
  end

  # def self.find_all_by_transaction(input)
  #   transactions_found = @transaction_totals.find_all {|transaction| transaction.invoice_id == input}
  #   return transactions_found
  end
end