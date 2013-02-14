class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store_array(array)
    @customer_totals = array
  end

  def self.find_all_by_id(input)
    ids_found = @customer_totals.find_all {|customer| customer.id == input}
    return ids_found
  end

  def self.find_all_by_first_name(input)
    first_names_found = @customer_totals.find_all {|customer| customer.first_name == input}
    return first_names_found
  end

  def self.find_all_by_last_name(input)
    last_names_found = @customer_totals.find_all {|customer| customer.last_name == input}
    return last_names_found
  end

  # def self.find_all_by_created_at(input)
  #   
  # end

  # def self.find_all_by_updated_at(input)
  #   
  # end

end