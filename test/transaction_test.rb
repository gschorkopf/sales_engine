require './test/support'

class TransactionTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    trans = Transaction.new
    assert_kind_of Transaction, trans
  end

end