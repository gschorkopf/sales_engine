class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store_array(array)
    @merchant_totals = array
  end

  # def self.find_all_by_store_name(input)
  #   store_names_found = @merchant_totals.find_all {|merchant| merchant.store_name == input}
  #   return store_names_found
  # end

end