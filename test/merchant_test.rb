require './test/support'

class MerchantTest < MiniTest::Unit::TestCase
  
  def setup
    @output = MerchantBuilder.from_csv("./sample/samp_merchants.csv")
    ItemBuilder.from_csv("./sample/samp_items.csv")
    InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
    InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
  end

  def test_it_exists
    merchant = Merchant.new('sample_hash')
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
    assert_equal "Willms and Sons", merchant.name #could this be 'merchant_names.find'?
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
    top_merchant = most_revenue.first
    assert_equal 2, most_revenue.length
    assert_equal "Balistreri, Schaefer and Kshlerin", top_merchant.name
  end

  def test_most_items_x_returns_merchant_list_of_x_numbers_sorted_by_items_sold
    most_items = Merchant.most_items(2)
    top_merchant = most_items.first
    assert_equal 2, most_items.length
    assert_equal "Balistreri, Schaefer and Kshlerin", top_merchant.name
  end

end