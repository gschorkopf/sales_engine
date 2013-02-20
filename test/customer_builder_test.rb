require './test/support'

module SalesEngine

  class CustomerBuilderTest < MiniTest::Unit::TestCase
    
    def setup
      @output = CustomerBuilder.from_csv("./sample/samp_customers.csv")
    end

    def test_it_exists
      cust_builder = CustomerBuilder.new
      assert_kind_of CustomerBuilder, cust_builder
    end

    def test_it_builds_customers_from_a_csv
      assert_operator 5, :<=, @output.size
    end

  end
end