class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @customer_totals = array
  end

  def self.find_by_id(input)
    @customer_totals.find {|customer| customer.id == input.to_i}
  end

   def self.find_by_first_name(input)
    @customer_totals.find {|customer| customer.first_name == input}
  end

  def self.find_by_last_name(input)
    @customer_totals.find {|customer| customer.last_name == input}
  end

  def self.find_all_by_id(input)
    @customer_totals.find_all {|customer| customer.id == input.to_i}
  end

  def self.find_all_by_first_name(input)
    first_names_found = @customer_totals.find_all {|customer| customer.first_name == input}
    return first_names_found
  end

  def self.find_all_by_last_name(input)
    last_names_found = @customer_totals.find_all {|customer| customer.last_name == input}
    return last_names_found
  end

end