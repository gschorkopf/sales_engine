require './test/support'

module SalesEngine
  class MerchantBuilderTest < MiniTest::Unit::TestCase
    
    def setup
      @output = MerchantBuilder.from_csv("./sample/samp_merchants.csv")
    end

    def test_it_exists
      merchant_builder = MerchantBuilder.new
      assert_kind_of MerchantBuilder, merchant_builder
    end

    def test_it_builds_merchants_from_a_csv
      assert_equal 6, @output.size
    end

  end
end