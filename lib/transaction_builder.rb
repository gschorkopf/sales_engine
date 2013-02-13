class TransactionBuilder
  def self.load_transactions
    transaction_file = CSV.open('./data/transactions.csv', headers: true, header_converters: :symbol)
    parse_transactions(transaction_file)
  end

  def self.parse_transactions(transaction_file)
    transaction_totals = []
    transaction_file.each do |transaction|
      transaction  = {
                id: transaction[:id],
                invoice_id: transaction[:invoice_id],
                credit_card_number: transaction[:credit_card_number],
                credit_card_expiration_date: transaction[:credit_card_expiration_date],
                result: transaction[:result],
                created_at: transaction[:created_at],
                updated_at: transaction[:updated_at],
                   }
      transaction_totals << transaction
    end
    # Transaction.new(@transaction_totals)
    return transaction_totals
  end

end