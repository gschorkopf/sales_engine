require './test/support'

class ItemTest < MiniTest::Unit::TestCase
  
  def setup
    ItemBuilder.from_csv("./sample/samp_items.csv")
  end

  def test_it_exists
    item = Item.new('sample_hash')
    assert_kind_of Item, item
  end

  def test_find_by_id_finds_single_instance_of_matching_id
    item = Item.find_by_id(4)
    assert_equal 4, item.find
  end

  def test_find_all_by_id_finds_all_items_by_matching_id
    item_ids = Item.find_all_by_id(3)
    assert_equal 1, item_ids.length
  end

  def test_find_all_by_id_finds_all_items_by_matching_string_id
    item_ids = Item.find_all_by_id('3')
    assert_equal 1, item_ids.length
  end

  def test_find_by_name_finds_items_by_matching_name
    item_names = Item.find_by_name("Item Qui Esse")
    assert_equal "Item Qui Esse", item_names.name
  end

  def test_find_all_by_name_finds_all_items_by_matching_name
    item_names = Item.find_all_by_name("Item Qui Esse")
    assert_equal 1, item_names.length
  end

  def test_find_by_name_finds_items_by_matching_description
    item_descriptions = Item.find_by_description("Nihil AUtem sit")
    assert_equal "Nihil autem sit", item_descriptions.description
  end

  def test_find_all_by_description_finds_all_items_by_matching_description
    item_descriptions = Item.find_all_by_description("Nihil AUtem sit")
    assert_equal 1, item_descriptions.length
  end 

  def test_find_by_name_finds_items_by_matching_unit_price
    item_unit_prices = Item.find_by_unit_price("75107")
    assert_equal 75107, item_unit_prices.length
  end

  def test_find_all_by_unit_price_finds_all_items_by_matching_unit_price
    item_unit_prices = Item.find_all_by_unit_price
    assert_equal 1, item_unit_prices.length
  end

  def test_find_by_name_finds_items_by_matching_merchant_id
    item_merchant_ids = Item.find_by_merchant_id(3)
    assert_equal 3, item_merchant_ids.length
  end

  def test_find_all_by_merchant_id_finds_all_items_by_matching_merchant_id
    item_merchant_ids = Item.find_all_by_merchant_id(4)
    assert_equal 1, item_merchant_ids.length
  end

end

