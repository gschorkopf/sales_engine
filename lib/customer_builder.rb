class CustomerBuilder

  def self.load_customers
    customer_file = CSV.open('./data/customers.csv', headers: true, header_converters: :symbol)
    parse_customers(customer_file)
  end

  def self.parse_customers(customer_file)
    customer_totals = []
    customer_file.each do |customer|
      customer  = {
                id: customer[:id],
                first_name: customer[:first_name],
                last_name: customer[:last_name],
                created_at: customer[:created_at],
                updated_at: customer[:updated_at],
                   }
      customer_totals << customer
    end
    # Customer.new(@customer_totals)
    return customer_totals
  end
end