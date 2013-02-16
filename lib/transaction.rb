class Transaction
  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @invoice_id = hash['invoice_id'].to_i
    @credit_card_number = hash['credit_card_number'].to_i
    @credit_card_expiration_date = hash['credit_card_expiration_date'] #do we need .to_i on this?
    @result = hash['result']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @transaction_totals = array
  end

  def self.find_all_by_invoice_id(input)
    @transaction_totals.find_all {|transaction| transaction.invoice_id == input.to_i}
  end

end