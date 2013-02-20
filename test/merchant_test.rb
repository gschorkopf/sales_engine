require './test/support'

module SalesEngine
  class MerchantTest < MiniTest::Unit::TestCase
    
    def setup
      @output = MerchantBuilder.from_csv("./sample/samp_merchants.csv")
      ItemBuilder.from_csv("./sample/samp_items.csv")
      InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
      InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
      TransactionBuilder.from_csv("./sample/samp_transactions.csv")
      CustomerBuilder.from_csv("./sample/samp_customers.csv")
    end

    def test_it_exists
      merchant = Merchant.random
      assert_kind_of Merchant, merchant
    end

    def test_find_by_id_finds_single_instance_of_matching_id
      merchant = Merchant.find_by_id(4)
      assert_equal 4, merchant.id
    end

    def test_find_all_by_id_finds_all_merchants_by_matching_id
      merchant_ids = Merchant.find_all_by_id(3)
      assert_equal 1, merchant_ids.length
    end

    def test_find_all_by_id_finds_all_merchants_by_matching_string_id
      merchant_ids = Merchant.find_all_by_id('3')
      assert_equal 1, merchant_ids.length
    end

    def test_find_by_name_finds_merchants_by_matching_name
      merchant = Merchant.find_by_name("Willms and Sons")
      assert_equal "Willms and Sons", merchant.name
    end

    def test_find_all_by_name_finds_all_merchants_by_matching_name
      merchant_names = Merchant.find_all_by_name("Willms and Sons")
      assert_equal 1, merchant_names.length
    end

    def test_items_method_returns_collection_of_associated_merchants
      first_merchant = @output.first
      assert_equal 4, first_merchant.items.length
    end

    def test_invoices_method_returns_collection_of_associated_merchants
      first_merchant = @output.first
      assert_equal 0, first_merchant.invoices.length
    end

    def test_most_revenue_x_returns_merchant_list_of_x_numbers_sorted_by_total_revenue
      most_revenue = Merchant.most_revenue(2)
      assert_equal 2, most_revenue.length
      assert_equal "Balistreri, Schaefer and Kshlerin", most_revenue.first.name
    end

    def test_most_items_x_returns_merchant_list_of_x_numbers_sorted_by_items_sold
      most_items = Merchant.most_items(2)
      assert_equal 2, most_items.length
      assert_equal "Balistreri, Schaefer and Kshlerin", most_items.first.name
    end

    def test_revenue_returns_total_rev_for_specific_merch
      merchant = Merchant.find_by_id(75)
      assert_equal Clean.price(237423), merchant.revenue
    end

    def test_class_variable_revenue_date_returns_total_rev_for_date_all_merchants
      date_amount = Merchant.revenue(Clean.date('Sat, 12 Mar 2012'))
      assert_equal Clean.price(237423), date_amount
    end

    def test_instance_variable_revenue_date_returns_total_rev_for_specific_date
      date_amount = Merchant.find_by_id(26).revenue(Clean.date('Sat, 25 Mar 2012'))
      assert_equal Clean.price(1117643), date_amount
    end

    def test_favorite_customer_returns_customer_with_most_transactions
      merchant = Merchant.find_by_id(75)
      assert_equal "Joey", merchant.favorite_customer.first_name
    end

    def test_another_favorite_customer_returns_customer_with_most_transactions
      merchant = Merchant.find_by_id(52)
      assert_equal "Loyal", merchant.favorite_customer.first_name
    end

    def test_customers_with_pending_invoices_returns_collection_of_customers_with_unpaid_invoices
      merchant = Merchant.find_by_id(75)
      assert_equal 1, merchant.customers_with_pending_invoices.length
    end

  end
end