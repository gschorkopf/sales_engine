require './test/support'

class CustomerTest < MiniTest::Unit::TestCase
  
  def setup
    @output = CustomerBuilder.from_csv("./sample/samp_customers.csv")
    InvoiceBuilder.from_csv("./sample/samp_invoices.csv") # need to run to have invoice object built
  end

  def test_it_exists
    customer = Customer.new('sample_hash')
    assert_kind_of Customer, customer
  end

  def test_random_returns_random_instance
    customer1 = Customer.random
    @output.delete(customer1)
    customer2 = Customer.random
    refute_equal customer1, customer2
  end

  def test_find_by_id_finds_single_instance_of_match
    customer = Customer.find_by_id(3)    
    assert_equal 3, customer.id
  end

  def test_find_by_first_name_finds_single_instance_match
    customer = Customer.find_by_first_name("Leanne")    
    assert_equal "Leanne", customer.first_name
  end

  def test_find_by_first_name_with_caps_still_finds_single_instance_match
    customer = Customer.find_by_first_name("LeAnNe")    
    assert_equal "Leanne", customer.first_name
  end

  def test_find_by_last_name_finds_single_instance_of_match
    customer = Customer.find_by_last_name("Nader")    
    assert_equal "Nader", customer.last_name
  end

  def test_find_all_by_id_finds_all_customers_by_matching_id
    customer_ids = Customer.find_all_by_id(3)
    assert_equal 1, customer_ids.length
  end

  def test_find_all_by_id_finds_all_customers_by_matching_string_id
    customer_ids = Customer.find_all_by_id('3')
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

  def test_invoices_method_returns_instance_of_invoice
    first_customer = @output.first #Joey object returned
    assert_equal 5, first_customer.invoices.length #how many invoices does joey have?
  end

end