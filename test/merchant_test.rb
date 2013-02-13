require './test/support'

class MerchantTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    merchant = Merchant.new
    assert_kind_of Merchant, merchant
  end

end