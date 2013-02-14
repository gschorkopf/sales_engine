require './test/support'

class TransactionTest < MiniTest::Unit::TestCase
  
  def setup
    TransactionBuilder.load_transactions("./sample/samp_transactions.csv")
  end

  def test_it_exists
    trans = Transaction.new('sample_hash')
    assert_kind_of Transaction, transaction
  end

  # def test_find_by_first_name_finds_all_transactions_by_matching_name
  #   transaction = Transaction.find_all_by_first_name("Leanne")
  #   assert_operator 2, :==, transaction.length
  # end

end