require './test/support'

class ItemTest < MiniTest::Unit::TestCase
  
  def setup
    InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
    MerchantBuilder.from_csv("./sample/samp_merchants.csv")
    @output = ItemBuilder.from_csv("./sample/samp_items.csv")
  end

  def test_it_exists
    item = Item.new('sample_hash')
    assert_kind_of Item, item
  end

  def test_find_by_id_finds_single_instance_of_matching_id
    item = Item.find_by_id(4)
    assert_equal 4, item.id
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
    item_names = Item.find_by_name("item qui esse")
    assert_equal "Item Qui Esse", item_names.name
  end

  def test_find_all_by_name_finds_all_items_by_matching_name
    item_names = Item.find_all_by_name("Item Qui Esse")
    assert_equal 1, item_names.length
  end

  def test_find_by_description_finds_items_by_matching_description
    item = Item.find_by_description("Nihil aUTem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal "Item Qui Esse", item.name
  end

  def test_find_all_by_description_finds_all_items_by_matching_description
    item_descriptions = Item.find_all_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal 1, item_descriptions.length
  end 

  def test_find_by_unit_price_finds_items_by_matching_unit_price
    item = Item.find_by_unit_price(75107)
    assert_equal 75107, item.unit_price
  end

  def test_find_all_by_unit_price_finds_all_items_by_matching_unit_price
    item_unit_prices = Item.find_all_by_unit_price(75107)
    assert_equal 1, item_unit_prices.length
  end

  def test_find_by_merchant_id_finds_items_by_matching_merchant_id
    item_merchant_ids = Item.find_by_merchant_id(1)
    assert_equal 1, item_merchant_ids.merchant_id
  end

  def test_find_all_by_merchant_id_finds_all_items_by_matching_merchant_id
    item_merchant_ids = Item.find_all_by_merchant_id(1)
    assert_equal 4, item_merchant_ids.length
  end

  def test_merchant_instance_method_finds_merchant_associated_with_item
    first_item = @output.first
    assert_equal "Schroeder-Jerde", first_item.merchant.name
  end

  def test_invoice_items_method_finds_collection_of_invoice_items_associated_with_item
    item = Item.find_by_id(539)
    assert_equal 2, item.invoice_items.length
  end

  def test_most_items_x_returns_item_list_of_x_numbers_sorted_by_items_sold
    most_items = Item.most_items(4)
    top_item = most_items.first
    assert_equal 4, most_items.length
    assert_equal "Item Quae Dolore", top_item.name
    assert_equal "Item Eius Et", most_items.last.name
  end

end

