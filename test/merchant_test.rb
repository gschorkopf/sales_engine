require './test/support'

class MerchantTest < MiniTest::Unit::TestCase
  
  def setup
    MerchantBuilder.from_csv("./sample/samp_merchants.csv")
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

end