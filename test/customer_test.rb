require './test/support'

class CustomerTest < MiniTest::Unit::TestCase
  
  def setup
    CustomerBuilder.load_customers("./sample/samp_customers.csv")
  end

  def test_it_exists
    customer = Customer.new('sample_hash')
    assert_kind_of Customer, customer
  end

  def test_find_by_first_name_finds_all_customers_by_matching_name
    customer = Customer.find_all_by_first_name("Leanne")
    assert_operator 2, :<=, customer.length
  end


end