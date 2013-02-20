module SalesEngine
  class TransactionBuilder
    
    def self.from_csv(filename="./data/transactions.csv")
      parse CSV.open(filename, headers: true)
    end

    def self.parse(transaction_file)
      transactions = transaction_file.collect do |transaction|
        Transaction.new(transaction)
      end
      Transaction.store(transactions)
    end

  end
end