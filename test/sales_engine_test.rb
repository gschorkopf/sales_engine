require './test/support'

module SalesEngine
  class SalesEngineTest < MiniTest::Unit::TestCase
    
    def test_it_exists
      sales_engine = SalesEngine.new
      assert_kind_of SalesEngine, sales_engine
    end

  end
end