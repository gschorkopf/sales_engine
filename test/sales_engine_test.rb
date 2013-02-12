require './test/support'

class SalesEngineTest < MiniTest::Unit::TestCase
  
  def test_it_exists
    sales_engine = SalesEngine.new("parameter?")
    assert_kind_of SalesEngine, sales_engine
  end

end