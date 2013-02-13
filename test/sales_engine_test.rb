require './test/support'

class SalesEngineTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    sales_engine = SalesEngine.new
    assert_kind_of SalesEngine, sales_engine
  end

  def test_that_merchant_csv_loads_upon_startup
    sales_engine = SalesEngine.new
    assert_equal "Load complete!", sales_engine.startup
  end

  def test_that_merchant_csv_parsed_correctly
    sales_engine = SalesEngine.new
    sales_engine.startup
    assert_equal 100, @merchant_totals.to_a
  end

end