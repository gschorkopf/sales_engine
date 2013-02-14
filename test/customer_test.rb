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
    assert_operator 2, :==, customer.length

  def test_find_all_by_id_finds_all_customers_by_matching_id
    customer_ids = Customer.find_all_by_id("3")
    assert_equal 1, customer_ids.length

  end

  def test_find_all_by_first_name_finds_all_customers_by_matching_name
    customer_first_names = Customer.find_all_by_first_name("Leanne")
    assert_equal 2, customer_first_names.length
  end

  def test_find_all_by_last_name_finds_all_customers_by_matching_name
    customer_last_names = Customer.find_all_by_last_name("Nader")
    assert_equal 2, customer_last_names.length
  end

end