require './test/support'

module SalesEngine
  class ItemTest < MiniTest::Unit::TestCase
    
    def setup
      InvoiceItemBuilder.from_csv("./sample/samp_invoice_items.csv")
      InvoiceBuilder.from_csv("./sample/samp_invoices.csv")
      MerchantBuilder.from_csv("./sample/samp_merchants.csv")
      @output = ItemBuilder.from_csv("./sample/samp_items.csv")
    end

    def test_it_exists
      item = Item.random
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
      item = Item.find_by_unit_price(Clean.price(75107))
      assert_equal Clean.price(75107), item.unit_price
    end

    def test_find_all_by_unit_price_finds_all_items_by_matching_unit_price
      item_unit_prices = Item.find_all_by_unit_price(Clean.price(75107))
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

    def test_most_revenue_x_returns_item_list_of_x_numbers_sorted_by_total_revenue
      most_revenue = Item.most_revenue(3)
      assert_equal 3, most_revenue.length
      assert_equal "Item Eius Et", most_revenue.first.name
      assert_equal "Item Pariatur Quia", most_revenue.last.name
    end

    def test_most_items_x_returns_item_list_of_x_numbers_sorted_by_items_sold
      most_items = Item.most_items(4)
      assert_equal 4, most_items.length
      assert_equal "Item Quae Dolore", most_items.first.name
      assert_equal "Item Eius Et", most_items.last.name
    end

    def test_best_day_returns_date_with_most_sales_for_item_using_invoice_date
      date = Date.parse "Sat, 25 Mar 2012"
      assert_equal date, Item.find_by_id(539).best_day
    end
  end
end

