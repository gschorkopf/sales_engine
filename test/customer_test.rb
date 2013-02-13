require './test/support'

class CustomerTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    customer = Customer.new
    assert_kind_of Customer, customer
  end

end