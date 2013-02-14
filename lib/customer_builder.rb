class CustomerBuilder

  def self.load_customers(filename="./data/customers.csv")
    parse_customers CSV.open(filename, headers: true)
  end

  def self.parse_customers(customer_file)
    customers = customer_file.collect do |customer|
      Customer.new(customer)
    end
    Customer.store(customers)
  end
end