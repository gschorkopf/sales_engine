require './test/support'

class TransactionTest < MiniTest::Unit::TestCase
  
  def setup
    InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
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

  def test_invoice_method_finds_instance_of_invoice_associated_with_transaction
    transaction = Transaction.find_by_id(2)
    assert_equal 75, transaction.invoice.merchant_id
  end

  def test_is_successful_when_status_is_success
    transaction = Transaction.new({'result' => 'success'})
    assert_equal 'success', transaction.result
    assert transaction.success?
  end

  def test_is_not_successful_when_status_is_failed
    transaction = Transaction.new({'result' => 'failed'})
    refute transaction.success?
  end

end