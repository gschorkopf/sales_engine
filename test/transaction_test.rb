require './test/support'

class TransactionTest < MiniTest::Unit::TestCase
  
  def setup
    TransactionBuilder.from_csv("./sample/samp_transactions.csv")
  end

  def test_it_exists
    transaction = Transaction.new('sample_hash')
    assert_kind_of Transaction, transaction
  end

  def test_find_all_by_invoice_id_finds_all_invoices_by_matching_id
    transactions = Transaction.find_all_by_invoice_id(4)
    assert_equal 1, transactions.length
  end

end