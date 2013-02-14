class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id']
    @name = hash['name']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @merchant_totals = array
  end

  def self.find_by_id(input)
    @merchant_totals.find {|merchant| merchant.id == input.to_i}
  end

  def self.find_all_by_id(input)
    @merchant_totals.find_all {|merchant| merchant.id == input.to_i}
  end

  def self.find_by_name(input) 
    @merchant_totals.find_by_name {|merchant| merchant.name == input}
  end

  def self.find_all_by_name(input)
    @merchant_totals.find_all_by_name {|merchant| merchant.name == input}
  end

end