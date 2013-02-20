require './test/support'

module SalesEngine
  class ItemBuilderTest < MiniTest::Unit::TestCase
    
    def setup
      @output = ItemBuilder.from_csv("./sample/samp_items.csv")
    end

    def test_it_exists
      item_builder = ItemBuilder.new
      assert_kind_of ItemBuilder, item_builder
    end

    # def test_it_builds_item_list_from_a_csv
    #   assert_operator 5, :<=, @output.size
    # end

  end
end