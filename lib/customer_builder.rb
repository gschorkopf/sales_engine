class CustomerBuilder

  def self.load_customers(filename="./data/customers.csv")
    customer_file = CSV.open(filename, headers: true)
    parse_customers(customer_file)
  end

  def self.parse_customers(customer_file)
    customer_totals = []
    customer_file.collect do |customer|
      customer_totals << Customer.new(customer)
    end
    Customer.store_array(customer_totals)
    return customer_totals
  end
end