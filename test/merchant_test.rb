require './test/support'

class MerchantTest < MiniTest::Unit::TestCase
  
  def setup
    MerchantBuilder.load_merchants("./sample/samp_merchants.csv")
  end

  def test_it_exists
    merchant = Merchant.new('sample_hash')
    assert_kind_of Merchant, merchant
  end

  # def test_find_by_first_name_finds_all_customers_by_matching_name
  #   merchant = Merchant.find_all_by_first_name("Leanne")
  #   assert_operator 2, :==, customer.length
  # end

end