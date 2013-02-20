require './test/support'

module SalesEngine

  class CustomerTest < MiniTest::Unit::TestCase
    
    def setup
      @output = CustomerBuilder.from_csv("./sample/samp_customers.csv")
      InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
      TransactionBuilder.from_csv("./sample/samp_transactions.csv")
      MerchantBuilder.from_csv("./sample/samp_merchants.csv")
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
      first_customer = @output.first
      assert_equal 6, first_customer.invoices.length
    end

    def test_transactions_method_returns_all_trans_associated_with_customer
      joey = Customer.find_by_first_name("Joey")
      assert_equal 6, joey.transactions.length
    end

    # def test_favorite_merchant_method_returns_fav_merchant_based_on_successful_transactions
    #   joey = Customer.find_by_first_name("Joey")
    #   assert_equal "Eichmann-Turcotte", joey.favorite_merchant.name
    # end

  end
end