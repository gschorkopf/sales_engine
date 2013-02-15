require './test/support'

class TransactionBuilderTest < MiniTest::Unit::TestCase
  
  def setup
    @output = TransactionBuilder.from_csv("./sample/samp_transactions.csv")
  end

  def test_it_exists
    transaction_builder = TransactionBuilder.new
    assert_kind_of TransactionBuilder, transaction_builder
  end

  # def test_it_parses
  #   assert_operator 5, :<=, @output.size
  # end

end