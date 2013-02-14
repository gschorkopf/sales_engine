require './test/support'

class MerchantBuilderTest < MiniTest::Unit::TestCase
  
  def setup
    @output = MerchantBuilder.load_merchants("./sample/samp_merchants.csv")
  end

  def test_it_exists
    merchant_builder = MerchantBuilder.new
    assert_kind_of MerchantBuilder, merchant_builder
  end

  def test_it_builds_merchants_from_a_csv
    assert_operator 5, :<=, @output.size
  end

end