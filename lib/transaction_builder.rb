class TransactionBuilder
  
  def self.load_transactions(filename="./data/transactions.csv")
    transaction_file = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)
    parse_transactions(transaction_file)
  end

  def self.parse_transactions(transaction_file)
    transaction_totals = []
    transaction_file.collect do |transaction|
      transaction_totals << Transaction.new(transaction)
    end
    Transaction.store_array(transaction_totals)
    return transaction_totals
  end

end