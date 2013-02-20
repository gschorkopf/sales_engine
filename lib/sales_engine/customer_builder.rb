module SalesEngine
  class CustomerBuilder

    def self.from_csv(filename="./data/customers.csv")
      parse CSV.open(filename, headers: true)
    end

    def self.parse(customer_file)
      customers = customer_file.collect do |customer|
        Customer.new(customer)
      end
      Customer.store(customers)
    end
  end
end