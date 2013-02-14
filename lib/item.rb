class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(hash)
    @id = hash['id'].to_i
    @name = hash['name']
    @description = hash['description']
    @unit_price = hash['unit_price']
    @merchant_id = hash['merchant_id']
    @created_at = hash['created_at']
    @updated_at = hash['updated_at']
  end

  def self.store(array)
    @item_totals = array
  end

  def self.find_by_id(input)
    @item_totals.find {|item| item.id == input.to_i}
  end

  def self.find_all_by_id(input)
    @item_totals.find_all {|item| item.id == input.to_i}
  end

  def self.find_by_name(input) 
    @item_totals.find {|item| item.name == input}
  end

  def self.find_all_by_name(input)
    @item_totals.find_all {|item| item.name == input}
  end

  def self.find_by_description(input)
    @item_totals.find {|item| item.description == input}
  end

  def self.find_all_by_description(input)
    @item_totals.find_all{|item| item.description == input}
  end

  def self.find_by_unit_price(input) 
    @item_totals.find {|item| item.unit_price == input}
  end

  def self.find_all_by_unit_price(input)
    @item_totals.find_all {|item| item.unit_price == input}
  end  

  def self.find_by_merchant_id(input) 
    @item_totals.find {|item| item.merchant_id == input}
  end

  def self.find_all_by_merchant_id(input)
    @item_totals.find_all {|item| item.merchant_id == input}
  end
end







